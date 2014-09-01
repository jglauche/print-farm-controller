class PrintJobPosition < ActiveRecord::Base
  PrintJobPosition::New = 0
  PrintJobPosition::Slicing = 1
  PrintJobPosition::DoneWithSlicing = 5
  PrintJobPosition::Printing = 2
  PrintJobPosition::Done = 3
  PrintJobPosition::Fail = 4
  

  belongs_to :machine
  belongs_to :print_job
  
  before_destroy :delete_tmp_files
  
  scope :ready_to_print, where("status=#{PrintJobPosition::DoneWithSlicing}")
  
  def delete_tmp_files
    [get_filename(".gcode")].each do |filename|
      if File.exists?(filename)
        File.delete(filename)
      end
    end
    
  end
  
  def get_filename(extension)
    [RAILS_ROOT, "/", "tmp/gcode/", id, extension ].join
  end
  
  def gcode
    return nil if [PrintJobPosition::New, PrintJobPosition::Slicing].include? self.status
    
    filename = get_filename(".gcode")
    if File.exists?(filename)
      return File.read(filename)
    end    
    return nil
    
  end
  
  def done(qty=1, container=nil)
    return nil if self.status != PrintJobPosition::Done 
    self.print_job.quantity_done += qty
    self.print_job.quantity_printing -= self.quantity
    self.print_job.save
    self.machine.filament_used(filament_used_in_kg)
    self.machine.set_idle
    
    if container != nil
        Container.add_item(self.print_job.print_model_id,qty, self.machine_id, self.material_id, self.print_material_id)
    end
    
    self.destroy
  end
  
  def fail
    self.print_job.quantity_printing -= self.quantity
    self.print_job.quantity_failed += self.quantity
    self.print_job.save
    self.destroy
  end
  
  def get_backend_path
    if print_job.backend == nil
      print_job.get_default_backend
    end
    
    [RAILS_ROOT, "backends", print_job.backend.directory,"slic3r.pl"].join("/")    
  end
  
  # output in gram
  def filament_used
    Math::PI * (self.machine.print_material.current_diameter.to_f/2)**2 * self.print_material_length * self.machine.print_material.material.weight_per_mm
  end
  
  def filament_used_in_kg
      filament_used.to_f/1000
  end
  
end
