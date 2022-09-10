class RemoveIndexFromGolfClubs < ActiveRecord::Migration[7.0]
  def change
    remove_index :golf_clubs, name: "index_golf_clubs_on_itinerary_id"
  end
end
