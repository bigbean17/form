class LoginController < ApplicationController
    include ApplicationHelper

    before_action :check_login


    layout "auth"

    def new
    end

    def create

        user = User.find_by(username: login_params[:username]).try(:authenticate, login_params[:password])

        if user
            login(user)
            redirect_to main_index_path
        else
            flash.now[:login_error] = "invalid username or password"
            render :new, status: 422
        end
    end


    private
        def login_params
            params.permit(:username, :password)
        end

end
