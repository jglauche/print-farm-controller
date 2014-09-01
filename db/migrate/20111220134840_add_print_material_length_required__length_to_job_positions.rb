class AddPrintMaterialLengthRequired_lengthToJobPositions < ActiveRecord::Migration
  def self.up
    add_column :print_job_positions, :print_material_length, :float
  end

  def self.down
    remove_column :print_job_positions, :print_material_length
  end
end
