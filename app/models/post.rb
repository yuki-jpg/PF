class Post < ApplicationRecord

	belongs_to :member
	belongs_to :type
	attachment :image
	validates :title, presence: true
	validates :content, presence: true, length: {maximum: 200}
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(member)
	    favorites.where(member_id: member.id).exists?
	end

end
