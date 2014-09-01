class AddDimensionsToPrintModels < ActiveRecord::Migration
  def self.up
    add_column :print_models, :x, :decimal
    add_column :print_models, :y, :decimal
    add_column :print_models, :z, :decimal
  end

  def self.down
    remove_column :print_models, :z
    remove_column :print_models, :y
    remove_column :print_models, :x
  end
end
