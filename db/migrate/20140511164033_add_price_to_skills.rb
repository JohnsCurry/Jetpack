class AddPriceToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :price, :text
  end
end
