class DropColumnFromSkillCategories < ActiveRecord::Migration
  def change
    remove_column :skill_categories, :user_id
  end
end
