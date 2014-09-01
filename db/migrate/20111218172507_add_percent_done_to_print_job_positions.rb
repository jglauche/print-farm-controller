class AddPercentDoneToPrintJobPositions < ActiveRecord::Migration
  def self.up
    add_column :print_job_positions, :percent_done, :float
  end

  def self.down
    remove_column :print_job_positions, :percent_done
  end
end
