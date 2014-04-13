class DropTableSkillsCategories < ActiveRecord::Migration
  def change
    drop_table :skills_categories
  end
end
