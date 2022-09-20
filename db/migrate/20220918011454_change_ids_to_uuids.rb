class ChangeIdsToUuids < ActiveRecord::Migration[7.0]
  def change
    create_table "allowlisted_jwts", id: :uuid, force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "jti", null: false
      t.string "aud"
      t.datetime "exp", null: false
      t.uuid "user_id", null: false
      t.index ["jti"], name: "index_allowlisted_jwts_on_jti", unique: true
      t.index ["user_id"], name: "index_allowlisted_jwts_on_user_id"
    end

    create_table "users", id: :uuid, force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.string "name"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end

    add_foreign_key "allowlisted_jwts", "users", on_delete: :cascade
  end
end
