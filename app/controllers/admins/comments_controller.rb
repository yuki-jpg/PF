class Admins::CommentsController < ApplicationController
 before_action :authenticate_admin!
  


  def destroy
    comment=user.comments.find(params[:id])
    @post=comment.post
    comment.destroy
    redirect_to admins_post_path(post.id)
  end
end

