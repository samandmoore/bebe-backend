class CreateKids < ActiveRecord::Migration[7.0]
  def change
    create_table :kids, id: :uuid do |t|
      t.string :name, null: false
      t.datetime :date_of_birth, null: false
      t.belongs_to :user, type: :uuid, foreign_key: { on_delete: :cascade }, null: false

      t.timestamps
    end
  end
end
