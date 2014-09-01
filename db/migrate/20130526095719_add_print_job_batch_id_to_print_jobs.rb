class AddPrintJobBatchIdToPrintJobs < ActiveRecord::Migration
  def self.up
    add_column :print_jobs, :print_job_batch_id, :integer
  end

  def self.down
    remove_column :print_jobs, :print_job_batch_id
  end
end
