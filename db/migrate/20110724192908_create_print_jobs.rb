class CreatePrintJobs < ActiveRecord::Migration
  def self.up
    create_table :print_jobs do |t|
      t.integer :print_model_id
      t.integer :quantity
      t.integer :material_id
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :print_jobs
  end
end
