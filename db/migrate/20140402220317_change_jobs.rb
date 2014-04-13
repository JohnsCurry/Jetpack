class ChangeJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :city
    remove_column :jobs, :state
    remove_column :jobs, :zip
    add_column    :jobs, :address, :string
    add_column    :jobs, :latitude, :float
    add_column    :jobs, :longitude, :float
  end
end
