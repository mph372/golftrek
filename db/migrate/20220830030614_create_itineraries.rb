class CreateItineraries < ActiveRecord::Migration[7.0]
  def change
    create_table :itineraries do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.boolean :public_itinerary
      t.boolean :influencer_created
      t.string :influencer_creator
      t.string :influencer_link
      t.string :description

      t.timestamps
    end
  end
end
