class CreateSkillsCategories < ActiveRecord::Migration
  def change
    create_table :skills_categories do |t|
    t.integer :category_id, :skill_id
    end
  end
end
