class AddCurrentKidIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :current_kid, type: :uuid, foreign_key: { to_table: :kids, on_delete: :nullify }
  end
end
