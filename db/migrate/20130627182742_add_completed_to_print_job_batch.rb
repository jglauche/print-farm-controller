class AddCompletedToPrintJobBatch < ActiveRecord::Migration
  def self.up
    add_column :print_job_batches, :is_completed, :integer
  end

  def self.down
    remove_column :print_job_batches, :is_completed
  end
end
