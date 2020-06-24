class Post < ApplicationRecord
  include ImageUploader[:image]
  include SessionsHelper
  default_scope->{order(created_at: :desc)}

  belongs_to :contributer, class_name:'User', foreign_key: 'user_id'
  has_many :passive_like, class_name: "Like"
  has_many :like_users, through: :passive_like, source: :user
  has_many :comments
  has_many :notifications,dependent: :destroy
  has_and_belongs_to_many :hashtags

  validates :content, length:{maximum: 240}
  validates :image_data, presence: { message: "が選択されていません" }

  def create_notification_by(current_user)
    notification=current_user.active_notifications.new(
      post_id:self.id,
      visited_id:self.contributer.id,
      action:"like"
    )
    notification.save if notification.valid?
  end

  def delete_notification_by(current_user)
    notification=current_user.active_notifications.find_by(
      post_id:self.id,
      visited_id:self.contributer.id,
      action:"like"
    )
    notification.destroy if !notification.nil?
    end

 after_create do
    post = Post.find_by(id: self.id)
    hashtags  = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.hashtags.clear
    hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end
end
