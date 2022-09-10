class AddCascadeToModels < ActiveRecord::Migration[7.0]
  def change
      remove_foreign_key :line_items, :golf_clubs
      add_foreign_key :line_items, :golf_clubs, on_delete: :cascade
  end
end
