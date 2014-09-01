class AddArchiveToPrintModels < ActiveRecord::Migration
  def self.up
    add_column :print_models, :archive_id, :integer
  end

  def self.down
    remove_column :print_models, :archive_id
  end
end
