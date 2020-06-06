class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


enum status:{ 有効会員: 0, 無効会員: 1 }
  validates :name, presence: true, uniqueness: true,
                   length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  has_many :post, dependent: :destroy
  attachment :profile_image
end
