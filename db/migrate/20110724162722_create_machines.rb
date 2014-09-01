class CreateMachines < ActiveRecord::Migration
  def self.up
    create_table :machines do |t|
      t.string :nick
      t.string :uuid
      t.integer :print_material_id
      t.string :place

      t.timestamps
    end
  end

  def self.down
    drop_table :machines
  end
end
