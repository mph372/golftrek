class CreateGolfCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :golf_courses do |t|
      t.string :course_id
      t.string :club_id
      t.string :course_name
      t.integer :holes
      t.integer :par
      t.string :course_type
      t.string :course_architect
      t.date :open_date
      t.string :guest_policy
      t.string :currency
      t.integer :weekday_price
      t.integer :weekend_price
      t.integer :twilight_price
      t.string :fairway
      t.string :green
      t.date :last_update
      t.references :golf_club

      t.timestamps
    end
  end
end
