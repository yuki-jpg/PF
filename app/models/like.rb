class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :user_id,  uniqueness: { scope: [:post_id]}
  validates :post_id, presence: true
end