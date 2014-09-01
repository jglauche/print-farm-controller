class AddUriToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :uri, :string
  end

  def self.down
    remove_column :machines, :uri
  end
end
