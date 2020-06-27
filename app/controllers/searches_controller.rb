class SearchesController < ApplicationController
 before_action :login_user?
  def index
    @user=current_user
    if params[:query].length>20
      @alert="検索ワードは20文字以下にしてください"
      render 'searches/new'
    elsif params[:query].blank?
      @alert="検索ワードをいれてください"
      render 'searches/new'
    else
      @posts=Post.where("content LIKE ?","%#{params[:query]}%").page(params[:page]).per(12)
      @page_title="'#{params[:query]}'の検索結果"
    end
  end

  def new
    
  end

  def show
    redirect_to new_search_path
  end
end
