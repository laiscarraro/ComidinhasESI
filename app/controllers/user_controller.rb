class UserController < ApplicationController
    before_action :authorized, only: [:index, :payment_method] # verifica se o cara tá logado
    before_action :authenticate, only: [:update]

    def show
        if @user = User.find_by(id:params[:id])
           @products = Product.joins(:user).where("user_id = #{@user.id}")
        else
            redirect_to root_path
        end 
    end

    def payment_method
        @user = User.find(session[:user_id])
    end

    def authenticate
        user = current_user
        if !user.authenticate(params[:user][:password])
            @error = "Senha incorreta"
            render '/user/payment_method'
        end
    end

    def update
        @user = User.find(session[:user_id])
        if @user.update(money: params[:user][:money], card: params[:user][:card], vr: params[:user][:vr], pix: params[:user][:pix])
            redirect_to "/user/"
        else 
            @user.errors.each do |attribute, errorMsg|
                puts(errorMsg)
            end
            redirect_to '/user/payment_method'
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
            params.require(:user).permit(:email, :username, :password, :avatar, :password_confirmation, :money, :card, :vr, :pix)
        end   
end

