class CreateAllowedJwts < ActiveRecord::Migration[7.0]
  def change
    create_table :allowed_jwts do |t|
      t.string :jti, null: false
      t.string :aud
      t.datetime :exp, null: false
      t.references :users, foreign_key: { on_delete: :cascade }, null: false
    end

    add_index :allowed_jwts, :jti, unique: true
  end
end
