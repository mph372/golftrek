class AddLocationDataToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :address, :string
    add_column :line_items, :latitude, :float
    add_column :line_items, :longitude, :float
    add_column :line_items, :note, :text
  end
end
