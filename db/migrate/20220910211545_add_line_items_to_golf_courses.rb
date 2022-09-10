class AddLineItemsToGolfCourses < ActiveRecord::Migration[7.0]
  def change
    add_reference :golf_courses, :line_items, foreign_key: true
  end
end
