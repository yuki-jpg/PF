class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_out_path_for(resource)
        if resource != :admin
          root_path
        else
          new_admin_session_path
        end
    end

    def after_update_path_for(resource)
        members_path(resource)
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :birthday])
        #サインインならこのカラムでもいいよっていうこと。必ずしもこのカラムを入力しなければならないことはない。viewページでサインアップに必要なカラムを調整できる
    end
end
