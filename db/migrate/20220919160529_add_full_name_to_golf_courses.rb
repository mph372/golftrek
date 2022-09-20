class AddFullNameToGolfCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :golf_courses, :course_full_name, :string
  end
end
