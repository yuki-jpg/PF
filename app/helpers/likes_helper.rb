module LikesHelper
  private
    def like?(post)
      !current_user.active_like.find_by(post_id:post.id).nil?
    end
end
