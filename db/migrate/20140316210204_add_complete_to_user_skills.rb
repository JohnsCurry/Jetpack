class AddCompleteToUserSkills < ActiveRecord::Migration
  def change
    add_column :user_skills, :complete, :string
  end
end
