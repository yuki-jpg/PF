class PostsController < ApplicationController
 before_action :authenticate_member!

  def show
  	@posts = Post.find(params[:id])
  end

  def index
  	@posts = Post.all
  end

  def new
	@post = Post.new
  end



  def create
  	@post = Post.new(post_params)
    @post.member_id = current_member.id
  	if @post.save
  		redirect_to @post, notice: "successfully created !"
  	else
  		@posts = Post.all
  		render 'index'
  	end
  end

  def edit
    @post = Post.find(params[:id])
      if current_member != @post.member
      redirect_to posts_path
    end
  end



  def update
  	@post = Post.find(params[:id])
  	if @Post.update(post_params)
  		redirect_to @post, notice: "successfully updated !"
  	else
  		render "edit"
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to posts_path, notice: "successfully delete !"
  end

  private

  def post_params
  	params.require(:post).permit(:title, :content,:image)
  end

end
