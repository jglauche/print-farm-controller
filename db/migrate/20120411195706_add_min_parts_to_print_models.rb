class AddMinPartsToPrintModels < ActiveRecord::Migration
  def self.up
    add_column :print_models, :print_minimum, :integer
  end

  def self.down
    remove_column :print_models, :print_minimum
  end
end
