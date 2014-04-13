class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :salary
      t.text   :description
      t.timestamps
    end
  end
end
