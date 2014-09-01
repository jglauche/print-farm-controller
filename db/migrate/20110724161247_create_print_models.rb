class CreatePrintModels < ActiveRecord::Migration
  def self.up
    create_table :print_models do |t|
      t.string :filename
      t.string :md5sum
      t.integer :max_x, :default => 1
      t.integer :max_y, :default => 1
      t.float :default_infill, :default => 0.25
      t.float :default_layer_height, :default => 0.38
      t.float :weight
      t.time :printing_time
      t.integer :print_more_than_needed_if_possible, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :print_models
  end
end
