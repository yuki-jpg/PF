class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

    t.integer "post_id", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false


    t.index ["post_id"], name: "index_favorites_on_book_id"
    t.index ["member_id", "post_id"], name: "index_favorites_on_member_id_and_post_id", unique: true
    t.index ["member_id"], name: "index_favorites_on_member_id"

    t.timestamps
    end
  end
end
