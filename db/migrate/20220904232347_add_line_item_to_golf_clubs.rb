class AddLineItemToGolfClubs < ActiveRecord::Migration[7.0]
  def change
    add_reference :line_items, :golf_club, null: false, foreign_key: true
  end
end
