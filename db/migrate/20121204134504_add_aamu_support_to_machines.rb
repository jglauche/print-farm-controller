class AddAamuSupportToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :resets_automatically, :integer
  end

  def self.down
    remove_column :machines, :resets_automatically
  end
end
