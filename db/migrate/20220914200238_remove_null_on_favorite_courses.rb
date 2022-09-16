class RemoveNullOnFavoriteCourses < ActiveRecord::Migration[7.0]
  def change
    change_column_null :line_items, :itinerary_id, true
  end
end
