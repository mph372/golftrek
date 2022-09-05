class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.date :date
      t.datetime :time

      t.timestamps
    end
  end
end
