class AddBackendIdToPrintJobBatch < ActiveRecord::Migration
  def self.up
    add_column :print_job_batches, :backend_id, :integer
  end

  def self.down
    remove_column :print_job_batches, :backend_id
  end
end
