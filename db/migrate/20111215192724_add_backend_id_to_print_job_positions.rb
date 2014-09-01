class AddBackendIdToPrintJobPositions < ActiveRecord::Migration
  def self.up
    add_column :print_job_positions, :backend_id, :integer
  end

  def self.down
    remove_column :print_job_positions, :backend_id
  end
end
