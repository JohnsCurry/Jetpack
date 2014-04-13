class DropDegreeCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :degree
  end
end
