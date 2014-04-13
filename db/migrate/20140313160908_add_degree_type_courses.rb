class AddDegreeTypeCourses < ActiveRecord::Migration
  def change
    add_column    :courses, :degree, :string
    remove_column :courses, :grade
    add_column    :courses, :grade, :string
  end
end
