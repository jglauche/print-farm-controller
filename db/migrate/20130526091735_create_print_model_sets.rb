class CreatePrintModelSets < ActiveRecord::Migration
  def self.up
    create_table :print_model_sets do |t|
      t.string :name
      t.float :default_infill
      t.string :default_fill_pattern

      t.timestamps
    end
  end

  def self.down
    drop_table :print_model_sets
  end
end
