class AddGoogleSpotToGolfClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :golf_clubs, :google_places_spot, :string
  end
end
