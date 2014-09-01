class CreateContainerItems < ActiveRecord::Migration
  def self.up
    create_table :container_items do |t|
      t.integer :container_id
      t.integer :print_model_id
      t.integer :quantity
      t.integer :material_id
      t.integer :print_material_id
      t.integer :machine_id

      t.timestamps
    end
  end

  def self.down
    drop_table :container_items
  end
end
