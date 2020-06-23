class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

    t.timestamps
    end
  end
end
