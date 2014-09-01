class AddPrintJobBatchIdToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :print_job_batch_id, :integer
  end

  def self.down
    remove_column :machines, :print_job_batch_id
  end
end
