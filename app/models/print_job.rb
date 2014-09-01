class PrintJob < ActiveRecord::Base
  has_many :print_job_positions
  belongs_to :print_model
  belongs_to :material
  belongs_to :backend
  belongs_to :print_job_batch

	attr_accessor :plastic_type, :container_id, :machine_id
  
  PrintJob::New = 0

  
  scope :open, where("quantity > quantity_done + quantity_printing")
    

  def find_out_quantity(machine)
    needed = self.quantity - self.quantity_done - self.quantity_printing
    
    distance_between_prints = 6 # FIXME
    skirt_distance = 6 # FIXME
    skirt_margin = (6+machine.nozzle_size*1.8)*2
    
    # get max amount of stuff fitting this machine
    x,y = self.print_model.get_x_y_dimensions
    x+= distance_between_prints
    y+= distance_between_prints

    max_x = ((machine.build_size_x - skirt_margin + distance_between_prints) / x).to_i
    max_y = ((machine.build_size_y - skirt_margin + distance_between_prints) / y).to_i

    # hack    
    max_x = self.print_model.max_x if max_x > self.print_model.max_x
    max_y = self.print_model.max_y if max_y > self.print_model.max_y
    
    
    machine_max = max_x*max_y
    
    if self.print_model.print_maximum.to_i > 0
     if machine_max > self.print_model.print_maximum
       machine_max = self.print_model.print_maximum
     end      
    end
    
    if self.print_model.print_more_than_needed_if_possible.to_i == 1
      return machine_max
    end
    
    if self.print_model.print_minimum.to_i > 1
      if needed > machine_max
        needed = machine_max
      end
          
      return [self.print_model.print_minimum.to_i,needed].max   
    end
    
    return 1   
  end

  def get_default_backend
    self.backend = Backend.find_by_is_default(1)
    self.save
  end
  
end
