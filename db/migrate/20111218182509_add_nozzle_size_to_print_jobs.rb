class AddNozzleSizeToPrintJobs < ActiveRecord::Migration
  def self.up
    add_column :print_jobs, :nozzle_size, :float
    add_column :print_jobs, :layer_height, :float
  end

  def self.down
    remove_column :print_jobs, :layer_height
    remove_column :print_jobs, :nozzle_size
  end
end
