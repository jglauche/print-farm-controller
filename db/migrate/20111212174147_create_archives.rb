class CreateArchives < ActiveRecord::Migration
  def self.up
    create_table :archives do |t|
      t.string :name
      t.string :git_url
      t.timestamps
    end
  end

  def self.down
    drop_table :archives
  end
end
