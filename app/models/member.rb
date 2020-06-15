class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


enum status:{ 有効会員: 0, 無効会員: 1 }
  validates :name, presence: true, uniqueness: true,
                   length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  has_many :posts, dependent: :destroy
  attachment :profile_image
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :member


  def follow(other_member)
    unless self == other_member
      self.relationships.find_or_create_by(follow_id: other_member.id)
    end
  end

  def unfollow(other_member)
    relationship = self.relationships.find_by(follow_id: other_member.id)
    relationship.destroy if relationship
  end

  def following?(other_member)
    self.followings.include?(other_member)
  end

end

