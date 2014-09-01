class AddPrintMaximumToPrintModel < ActiveRecord::Migration
  def self.up
    add_column :print_models, :print_maximum, :integer
  end

  def self.down
    remove_column :print_models, :print_maximum
  end
end
