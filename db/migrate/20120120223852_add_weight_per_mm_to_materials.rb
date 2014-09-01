class AddWeightPerMmToMaterials < ActiveRecord::Migration
  def self.up
    add_column :materials, :weight_per_mm, :float
  end

  def self.down
    remove_column :materials, :weight_per_mm
  end
end
