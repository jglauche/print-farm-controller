class AddFillPatternToPrintModels < ActiveRecord::Migration
  def self.up
    add_column :print_models, :fill_pattern, :string
  end

  def self.down
    remove_column :print_models, :fill_pattern
  end
end
