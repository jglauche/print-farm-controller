class AddPlasticTypeToPrintJobBatch < ActiveRecord::Migration
  def self.up
    add_column :print_job_batches, :plastic_type, :string
  end

  def self.down
    remove_column :print_job_batches, :plastic_type
  end
end
