class CreatePrintMaterials < ActiveRecord::Migration
  def self.up
    create_table :print_materials do |t|
      t.integer :material_id
      t.float :filament_weight
      t.float :filament_left

      t.timestamps
    end
  end

  def self.down
    drop_table :print_materials
  end
end
