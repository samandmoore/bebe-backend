class RenameAllowlistedJwts < ActiveRecord::Migration[7.0]
  def change
    rename_table :allowed_jwts, :allowlisted_jwts
  end
end
