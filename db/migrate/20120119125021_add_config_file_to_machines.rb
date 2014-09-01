class AddConfigFileToMachines < ActiveRecord::Migration
  def self.up
    add_column :machines, :config_file, :string
  end

  def self.down
    remove_column :machines, :config_file
  end
end
