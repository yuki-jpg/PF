class PostsController < ApplicationController
before_action :login_user?
  before_action :correct_user, only: :destroy
  protect_from_forgery except: :create

  def index
    redirect_to new_post_path
  end

  def show
    @post=Post.find(params[:id])
    respond_to do |format|
      format.html { render 'posts/_show' }
      format.js
    end
  end

  def new
    @post=current_user.posts.build
    respond_to do |format|
      format.html { render 'posts/_new' }
      format.js
    end
  end

  def create
    @post=current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "画像を投稿しました"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { redirect_to root_path }
      end
    else
      respond_to do |format|
        format.html { render 'posts/_new' }
        format.js
      end
    end
  end

  def destroy
    post=Post.find(params[:id])
    post.destroy
    flash[:info]="投稿を取り消しました"
    redirect_to post.contributer
  end



  private
    def post_params
      params.require(:post).permit(:content,:image,:image_data)
    end

    def correct_user
      post=Post.find(params[:id])
      contributer=post.contributer
      unless current_user==contributer
        session[:danger] = "このページにはアクセスできません"
        redirect_to root_url
      end
    end
end
