class LoginController < ApplicationController
    def index
    end

    def user_exists
        user = User.find_by_username(params[:user])
        if(user)
            render :json => { :message => "true" }
        else
            render :json => { :message => "false"}
        end
    end

    def authenticate
        @user = User.find_by_username(params[:user])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/home/index'
        else
            render '/login/index'
        end
    end
end
