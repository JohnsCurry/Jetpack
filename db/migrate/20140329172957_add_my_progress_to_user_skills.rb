class AddMyProgressToUserSkills < ActiveRecord::Migration
  def change
    add_column :user_skills, :progress, :text
  end
end
