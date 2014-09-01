class AddIsDefaultToBackends < ActiveRecord::Migration
  def self.up
    add_column :backends, :is_default, :integer
  end

  def self.down
    remove_column :backends, :is_default
  end
end
