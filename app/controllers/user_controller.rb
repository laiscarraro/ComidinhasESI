class UserController < ApplicationController

    def new 
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            #redirect_to 'home'
        else
            render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :username, :password, :password_confirmation)
        end   
end

