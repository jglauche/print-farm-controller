class ChangePrintMaterialIdToMaterialIdInPrintJobBatches < ActiveRecord::Migration
  def self.up
    rename_column :print_job_batches, :print_material_id, :material_id
  end

  def self.down
    rename_column :print_job_batches, :material_id, :print_material_id
  end
end
