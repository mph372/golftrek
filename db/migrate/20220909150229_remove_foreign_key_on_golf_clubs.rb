class RemoveForeignKeyOnGolfClubs < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :golf_clubs, :itineraries
  end
end
