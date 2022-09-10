class AddGolfCoursestoLineItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :line_items, :golf_course, foreign_key: true
  end
end
