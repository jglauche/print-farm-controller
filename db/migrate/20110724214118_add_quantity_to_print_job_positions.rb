class AddQuantityToPrintJobPositions < ActiveRecord::Migration
  def self.up
    add_column :print_job_positions, :quantity, :integer
  end

  def self.down
    remove_column :print_job_positions, :quantity
  end
end
