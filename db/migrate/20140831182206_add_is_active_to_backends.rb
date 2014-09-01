class AddIsActiveToBackends < ActiveRecord::Migration
  def self.up
    add_column :backends, :is_active, :integer, :size => 1
  end

  def self.down
    remove_column :backends, :is_active
  end
end
