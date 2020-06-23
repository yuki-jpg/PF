class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    t.string "email"
    t.string "name"
    t.text "introduction"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account", null: false
    t.string "web"
    t.integer "tel"
    t.integer "sex", default: 2, null: false
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.text "image_data"
    t.timestamps
    end
  end
end
