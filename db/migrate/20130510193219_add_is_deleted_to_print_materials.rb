class AddIsDeletedToPrintMaterials < ActiveRecord::Migration
  def self.up
    add_column :print_materials, :is_deleted, :integer
  end

  def self.down
    remove_column :print_materials, :is_deleted
  end
end
