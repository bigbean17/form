module ApplicationHelper


    def login(user)
        session[:user_id] = user.id
    end


    def is_login?
        !current_user.nil?
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end


    def check_not_login
        unless is_login?
            redirect_to root_path
        end
    end

    def check_login
        unless !is_login?
            redirect_to main_index_path
        end
    end



    # def switch_model(brand)

    #     if brand == "DJI"
    #         [['DJI A1', 'DJI_A1'], ['DJI A2', "DJI_A2"]]
    #     else brand == "X"
    #         [['X X1', 'X_X1'], ['X X1', "X_X1"]]
    #     end
    # end 
    
end
