class CreatePrintJobPositions < ActiveRecord::Migration
  def self.up
    create_table :print_job_positions do |t|
      t.integer :print_job_id
      t.integer :status
      t.integer :machine_id

      t.timestamps
    end
  end

  def self.down
    drop_table :print_job_positions
  end
end
