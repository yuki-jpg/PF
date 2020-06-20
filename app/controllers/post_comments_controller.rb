class PostCommentsController < ApplicationController



def create
    @post = Post.find(params[:post_id]) #①
    @comment = @post.post_comments.build(comment_params) #②
    @comment.member_id = current_member.id #③
    if @comment.save
      render :index #④
    end
  end

  def destroy
    @comment = PostComment.find(params[:id]) #⑤
    if @comment.destroy
      render :index #⑥
    end
  end

  private
    def comment_params
      params.require(:post_comment).permit(:comment, :post_id, :member_id)
    end




end