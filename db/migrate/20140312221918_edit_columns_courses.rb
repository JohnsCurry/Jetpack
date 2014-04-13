class EditColumnsCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :gpa
    add_column    :courses, :grade, :integer
  end
end
