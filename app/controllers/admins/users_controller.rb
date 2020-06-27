class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
    @users=User.page(params[:page]).per(10)
    @user=current_user
    @page_title="ユーザ一覧"
  end

    def show
        @user = User.find(params[:id])
        @posts=@user.posts.page(params[:page])
    end

    def edit
        @users = User.find(params[:id])

    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to admins_user_path(@user.id)
        else
            @users = User.find(params[:id])
            render "edit"
        end
    end

    def destroy
    @user=User.find(params[:id])
    @user.destroy
    flash[:info] = "退会させました"
    redirect_to admins_users_path
  end

    def top
    end

    private

    def user_params
      params.require(:user).permit(
      :name, :email, :account, :sex, :introduction, :web, :tel, :password, :password_confirmation, :image)
    end

end
