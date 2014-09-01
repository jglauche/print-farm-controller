class PrintMaterial < ActiveRecord::Base
  # used to track the material that is left on the spool
  belongs_to :material

  has_one :machine

  default_scope :conditions => "is_deleted IS NULL or is_deleted = 0", :order => "id desc", :include => :machine
  
  def before_create
    if self.filament_left == nil
        self.filament_left = self.filament_weight
    end
  end
    
    
end
