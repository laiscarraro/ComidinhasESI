class UserController < ApplicationController
    before_action :authorized, only: [:index]

    def show
        if @user = User.find_by(id:params[:id])
            @products = Product.joins(:user).where("user_id = #{@user.id}")
            if @products
                ratings = nil
                ratings_total = 0
                @ratings = 0
                @products.ids.each do |id|
                    ratings = Product.find(id).ratings
                    ratings_total += ratings.count
                    ratings.each do |r|
                        @ratings = @ratings + r.rate_value
                    end
                end
                if ratings_total != 0
                    @ratings = @ratings.to_f/ratings_total.to_f
                end
            end
        else
            redirect_to root_path
        end 
    end

    def payment_method
        @user = User.find(session[:user_id])
    end

    def authenticate
        @user = User.find_by_username(params[:user])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
        else
            render js: "alert('Senha incorreta');"
        end
    end

    def update
        @user = User.find(session[:user_id])
        if @user.update(money: params[:user][:money], card: params[:user][:card], vr: params[:user][:vr], pix: params[:user][:pix], password: :password)
            redirect_to "/user/"
        else 
            @user.errors do |attribute, errorMsg|
                puts(errorMsg)
            end
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

