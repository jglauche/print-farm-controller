class CreatePrintModelSetPositions < ActiveRecord::Migration
  def self.up
    create_table :print_model_set_positions do |t|
      t.integer :print_model_set_id
      t.integer :print_model_id
      t.integer :quantity
      t.float :default_infill
      t.string :default_fill_pattern
      t.integer :priority, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :print_model_set_positions
  end
end
