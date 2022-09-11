class AddPermanentlyClosedToGolfClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :golf_clubs, :permanently_closed, :boolean, :default => false
    add_column :golf_clubs, :google_rating, :float
  end
end
