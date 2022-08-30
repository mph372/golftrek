class AddGolfClubsToItineraries < ActiveRecord::Migration[7.0]
  def change
    add_reference :golf_clubs, :itinerary, foreign_key: true
  end
end
