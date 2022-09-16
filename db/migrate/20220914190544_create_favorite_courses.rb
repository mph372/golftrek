class CreateFavoriteCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_courses do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
