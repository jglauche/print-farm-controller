class CreatePrintJobBatches < ActiveRecord::Migration
  def self.up
    create_table :print_job_batches do |t|
      t.integer :print_model_set_id
      t.integer :print_material_id
      t.integer :machine_id
      t.integer :container_id
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :print_job_batches
  end
end
