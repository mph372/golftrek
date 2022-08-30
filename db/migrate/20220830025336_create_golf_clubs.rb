class CreateGolfClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :golf_clubs do |t|
      t.string :club_id
      t.string :club_name
      t.string :club_membership
      t.integer :number_of_holes
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :phone
      t.string :website
      t.string :contact_name
      t.string :contact_title
      t.string :email_address
      t.boolean :driving_range
      t.boolean :putting_green
      t.boolean :chipping_green
      t.boolean :practice_bunker
      t.boolean :motor_cart
      t.boolean :pull_cart
      t.boolean :golf_clubs_rental
      t.boolean :club_fitting
      t.boolean :pro_shop
      t.boolean :golf_lessons
      t.boolean :caddie_hire
      t.boolean :restaurant
      t.boolean :reception_hall
      t.boolean :changing_room
      t.boolean :lockers
      t.boolean :lodging_on_site
      t.date :last_update

      t.timestamps
    end
  end
end
