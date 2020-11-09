class UserController < ApplicationController
    before_action :authorized, only: [:index]

    def show
        if @user = User.find_by(id:params[:id])
           @products = Product.joins(:user).where("user_id = #{@user.id}")
        else
            redirect_to root_path
        end 
    end

    def index
        @products = Product.joins(:user).where("user_id = #{@user.id}")
    end

    def new 
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
           redirect_to "/login/index"
        else
            render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :username, :password, :avatar, :password_confirmation)
        end   
end

