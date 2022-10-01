class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: :uuid do |t|
      t.belongs_to :kid, type: :uuid, foreign_key: true, null: false
      t.string :type, null: false
      t.datetime :started_at, null: false
      t.datetime :ended_at
      t.jsonb :fields, null: false, default: {}

      t.timestamps
    end
  end
end
