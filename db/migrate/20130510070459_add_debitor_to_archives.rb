class AddDebitorToArchives < ActiveRecord::Migration
  def self.up
    add_column :archives, :debitor, :integer
  end

  def self.down
    remove_column :archives, :debitor
  end
end
