class AddUserIdToSkillCategories < ActiveRecord::Migration
  def change
    add_column :skill_categories, :user_id, :integer
  end
end
