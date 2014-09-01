class Material < ActiveRecord::Base
  # material typ
  
  has_many :print_material
  
  def name
    [self.plastic_type, self.colour].join(" ")    
  end
  
  def self.available
    #ids = Machine.operational.map{|l| l.print_material.material_id}.uniq
    #Material.find(ids)
    PrintMaterial.find(:all, :conditions => "filament_left >= 0.05").map{|l| l.material}.uniq
    
  end
  
  def self.plastic_type_available
    #ids = Machine.operational.map{|l| l.print_material.material_id}.uniq
    #Material.find(ids)
    PrintMaterial.find(:all, :conditions => "filament_left >= 0.05").map{|l| l.material.plastic_type}.uniq
    
  end


end
