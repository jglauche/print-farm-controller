class AddStateToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :state, :integer
  end

  def self.down
    remove_column :machines, :state
  end
end
