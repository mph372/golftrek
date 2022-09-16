class AddPositionToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :position, :integer
  end
end
