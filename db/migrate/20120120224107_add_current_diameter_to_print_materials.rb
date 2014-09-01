class AddCurrentDiameterToPrintMaterials < ActiveRecord::Migration
  def self.up
    add_column :print_materials, :current_diameter, :decimal
  end

  def self.down
    remove_column :print_materials, :current_diameter
  end
end
