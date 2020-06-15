class Type < ApplicationRecord
  has_many :posts, dependent: :destroy
  enum status:{有効: true,無効:false }
end
