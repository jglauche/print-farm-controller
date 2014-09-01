class AddNozzleSizeToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :nozzle_size, :float
    add_column :machines, :default_layer_height, :float
  end

  def self.down
    remove_column :machines, :default_layer_height
    remove_column :machines, :nozzle_size
  end
end
