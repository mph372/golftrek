class ChangeDateToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :golf_courses, :open_date
    add_column :golf_courses, :open_date, :integer
  end
end
