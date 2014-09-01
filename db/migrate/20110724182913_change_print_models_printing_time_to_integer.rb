class ChangePrintModelsPrintingTimeToInteger < ActiveRecord::Migration
  def self.up
    change_column :print_models, :printing_time, :integer
  end

  def self.down
  end
end
