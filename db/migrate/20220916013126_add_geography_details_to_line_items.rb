class AddGeographyDetailsToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :city, :string
    add_column :line_items, :state, :string
    add_column :line_items, :zip, :string
    add_column :line_items, :country, :string
  end
end
