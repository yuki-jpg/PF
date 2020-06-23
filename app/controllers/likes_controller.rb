class LikesController < ApplicationController
before_action :login_user?

  def create
    @post=Post.find(params[:post_id])
    current_user.like(@post)
    @post.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def destroy
    like=current_user.active_like.find(params[:id])
    @post=like.post
    like.destroy
    @post.delete_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end
end
