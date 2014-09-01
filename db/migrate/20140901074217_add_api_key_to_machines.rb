class AddApiKeyToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :api_key, :string
  end

  def self.down
    remove_column :machines, :api_key
  end
end
