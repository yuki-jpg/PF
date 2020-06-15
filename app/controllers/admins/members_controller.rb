class Admins::MembersController < ApplicationController
	 before_action :authenticate_admin!

    def index
        @members = Member.all
    end

    def show
        @member = Member.find(params[:id])
    end

    def edit
        @members = Member.find(params[:id])
        @member = Member.find(params[:id])
    end

    def update
        @member = Member.find(params[:id])
        if @member.update(member_params)
            redirect_to admins_member_path(@member.id)
        else
            @members = Member.find(params[:id])
            render "edit"
        end
    end

    def top
    end

    private

    def member_params
      params.require(:member).permit(:name, :email, :profile_image, :introduction, :birthday,:status)
    end

end
