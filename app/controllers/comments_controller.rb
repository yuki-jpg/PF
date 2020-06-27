class CommentsController < ApplicationController
include NotificationsHelper
  @@action_name="comment"
  before_action :login_user?

  def create
    comment=current_user.comments.new(post_id:params[:post_id],content: params[:comment][:content])
    @post=Post.find(params[:post_id])
    if comment.save
      comment.create_notification_by(current_user)
      respond_to do |format|
        format.html {redirect_to request.referrer || root_url}
        format.js
      end
    else
      respond_to do |format|
        format.html {redirect_to request.referrer || root_url}
        format.js
      end
    end
  end

  def destroy
    comment=current_user.comments.find(params[:id])
    @post=comment.post
    comment.destroy
    comment.delete_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer || root_url}
      format.js
    end
  end
end
