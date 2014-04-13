class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.integer :category_id, :skill_id
    end
  end
end
