class AddCoordinatesToGolfClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :golf_clubs, :latitude, :float
    add_column :golf_clubs, :longitude, :float
  end
end
