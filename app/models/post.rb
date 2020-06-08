class Post < ApplicationRecord

belongs_to :member
attachment :image
validates :title, presence: true
validates :content, presence: true, length: {maximum: 200}
end
