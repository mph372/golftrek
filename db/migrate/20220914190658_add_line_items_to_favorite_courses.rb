class AddLineItemsToFavoriteCourses < ActiveRecord::Migration[7.0]
  def change
    add_reference :line_items, :favorite_course, foreign_key: true
  end
end
