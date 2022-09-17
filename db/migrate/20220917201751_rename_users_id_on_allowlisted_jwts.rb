class RenameUsersIdOnAllowlistedJwts < ActiveRecord::Migration[7.0]
  def change
    rename_column :allowlisted_jwts, :users_id, :user_id
  end
end
