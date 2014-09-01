class AddTemporaryToPrintModelSets < ActiveRecord::Migration
  def self.up
    add_column :print_model_sets, :temporary, :integer
  end

  def self.down
    remove_column :print_model_sets, :temporary
  end
end
