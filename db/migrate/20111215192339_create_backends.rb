class CreateBackends < ActiveRecord::Migration
  def self.up
    create_table :backends do |t|
      t.string :name
      t.string :directory

      t.timestamps
    end
  end

  def self.down
    drop_table :backends
  end
end
