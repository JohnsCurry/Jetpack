class RemoveColumnsJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :address
    remove_column :jobs, :address2
  end
end
