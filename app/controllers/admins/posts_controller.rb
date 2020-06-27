class Admins::PostsController < ApplicationController
before_action :authenticate_admin!

def index
    @posts=Post.page(params[:page]).per(12)
  end

  def show
    @post=Post.find(params[:id])
  end


  def destroy
    post=Post.find(params[:id])
    post.destroy
    flash[:info]="投稿を取り消しました"
    redirect_to admins_posts_path
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts.build
    @post  = @tag.posts.page(params[:page])
    @comment    = Comment.new
    @comments   = @posts.comments
  end


  private
    def post_params
      params.require(:post).permit(:content,:image,:image_data)
    end

end

