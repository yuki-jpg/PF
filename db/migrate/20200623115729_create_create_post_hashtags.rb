class CreateCreatePostHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_posts, id: false  do |t|
      t.references :post, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
    end
  end
end
