class RemoveNullConstraintOnLineItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :line_items, :golf_club_id, true
  end
end
