class EditUserSkills < ActiveRecord::Migration
  def change
    remove_column :user_skills, :skill_id
    add_column :user_skills, :title, :string
    add_column :user_skills, :url,   :string
    add_column :user_skills, :description, :text
  end
end
