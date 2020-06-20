class RelationshipsController < ApplicationController
	before_action :set_member

  def create
    following = current_member.follow(@member)
    if following.save
      
     
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    following = current_member.unfollow(@member)
    if following.destroy
      
      
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def set_member
   @member = Member.find(params[:follow_id])
  end

end
