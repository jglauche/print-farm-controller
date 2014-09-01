class PrintJobBatch < ActiveRecord::Base

    has_many :print_jobs
    belongs_to :print_model_set
    
    scope :open, where("is_completed != 1 or is_completed IS NULL")
    
    def after_create
        self.print_model_set.print_model_set_positions.each do |p|
            PrintJob.create(:print_model_id => p.print_model_id,
                            :quantity => p.quantity,
                            :material_id => self.material_id,
                            :backend_id => self.backend_id,
                            :print_job_batch_id => self.id
            
            )
        end
        
        
    end
    
    def check_if_completed
        if self.print_jobs.open.size == 0  
            self.update_attributes :is_completed => 1
        end
    end
    
    def self.find_next_job(machine) 
        PrintJob.open.where(:material_id => machine.print_material.material_id, 
                            :print_job_batch_id => machine.print_job_batch_id
              ).order("priority desc").first
    end
    
    def self.find_new_batch_for_machine(machine)
        self.open.find(:all,
                       :conditions => {:machine_id => machine.id}, 
                       :order => "priority desc").map{|l|
            if l.print_jobs.where(:material_id => machine.print_material.material_id).size > 0
                return l
            end   
                    
        }
        return nil
    end
    
end

