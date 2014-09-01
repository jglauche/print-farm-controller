class AddCenterAndBuildSizeToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :center_x, :integer
    add_column :machines, :center_y, :integer
    add_column :machines, :build_size_x, :integer
    add_column :machines, :build_size_y, :integer
  end

  def self.down
    remove_column :machines, :build_size_y
    remove_column :machines, :build_size_x
    remove_column :machines, :center_y
    remove_column :machines, :center_x
  end
end
