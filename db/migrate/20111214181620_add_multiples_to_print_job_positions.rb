class AddMultiplesToPrintJobPositions < ActiveRecord::Migration
  def self.up
    add_column :print_job_positions, :duplicate_x, :integer
    add_column :print_job_positions, :duplicate_y, :integer
  end

  def self.down
    remove_column :print_job_positions, :duplicate_y
    remove_column :print_job_positions, :duplicate_x
  end
end
