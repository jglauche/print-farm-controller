class AddStuffToPrintJobs < ActiveRecord::Migration
  def self.up
    add_column :print_jobs, :quantity_done, :integer, :default => 0
    add_column :print_jobs, :quantity_printing, :integer, :default => 0
    add_column :print_jobs, :quantity_failed, :integer, :default => 0

  end

  def self.down
    remove_column :print_jobs, :quantity_done
    remove_column :print_jobs, :quantity_printing  
    remove_column :print_jobs, :quantity_failed  
  end
end
