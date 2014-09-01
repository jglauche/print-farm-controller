class RenameMaterialType < ActiveRecord::Migration
  def self.up
    rename_column :materials, :type, :plastic_type
  end

  def self.down
    rename_column :materials, :plastic_type, :type
  end
end
