class HomeController < ApplicationController
  include SessionsHelper
  def top
    current_user.nil? ? @user=User.new : @user=current_user
    @posts=Post.where("user_id IN (?) OR user_id = ?", @user.following_ids, @user.id).page(params[:page]).per(12)
  end

  def about
  end
end
