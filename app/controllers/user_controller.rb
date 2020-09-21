class UserController < ApplicationController
    def create
        @user = User.new(user_params)
        @user.save
    end
    private
        def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
    def new 
    end
end
