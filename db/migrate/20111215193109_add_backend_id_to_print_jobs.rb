class AddBackendIdToPrintJobs < ActiveRecord::Migration
  def self.up
    add_column :print_jobs, :backend_id, :integer
  end

  def self.down
    remove_column :print_jobs, :backend_id
  end
end
