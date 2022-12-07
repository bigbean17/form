class RegisterController < ApplicationController

    layout "auth"
    include ApplicationHelper
    before_action :check_login

    def new
        @user = User.new
    end


    def show
        @user = User.find(params[:id])
    end


    def create
        @user = User.new(register_param)

        if @user.save
            redirect_to signin_path
        else
            render :new, status: 422
        end
    end

    private
        def register_param
            params.permit(:username, :password)
        end
end
