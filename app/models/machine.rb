require 'net/http'
class Machine < ActiveRecord::Base

 # status
  Machine::Inoperational = 0
  Machine::Operational = 1
  
  # state
  Machine::Idle = 5
  Machine::Printing = 6
  Machine::Finished = 2
  Machine::Failure = 3
  Machine::WaitForReactivation = 4
  
  
  has_one :print_job_position
  belongs_to :print_material
  
  scope :operational, where("status = 1")
  
  after_save :disable_print_job_positions_if_failed
  
  def disable_print_job_positions_if_failed
     if self.status == Machine::Inoperational
       unless self.print_job_position == nil
         self.print_job_position.fail
       end       
     end
  end
  
  def self.status_select
    [
      ["Inoperational", Machine::Inoperational],
      ["Operational", Machine::Operational]
    ]    
  end
  
  def has_enough_filament?(kg)
    return false if self.print_material == nil
    return false if self.print_material.filament_left < kg
    return true
  end
  
  def set_idle
    self.update_attributes :state => Machine::Idle
  end
  
  def filament_used(weight)
    self.print_material.filament_left -= weight
    self.print_material.save
  end
  
  def state
    begin
      data = Net::HTTP.get URI.parse("#{self.uri}/api/state?apikey=#{self.api_key}")
      res = JSON.parse(data)
      
      self.state = res["state"]["state"]
      self.save
      
    rescue Exception => ex
      logger.info ex  
    end  
    
    
  end
  
  
end
