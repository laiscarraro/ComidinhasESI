class UserController < ApplicationController
    before_action :authorized, only: [:index, :payment_method, :phone_number] # verifica se o cara tá logado
    before_action :authenticate, only: [:update, :updatephone]
   

    def show
        if @user = User.find_by(id:params[:id])
            @products = Product.joins(:user).where("user_id = #{@user.id}")
            @ratings = ratings_mean(@products)
        else
            redirect_to root_path
        end 
    end

    def ratings_mean(products)
        if products.count > 0
            ratings_array = nil
            ratings_total = 0
            ratings = 0
            products.ids.each do |id|
                ratings_array = Product.find(id).ratings
                ratings_total += ratings_array.count
                ratings_array.each do |r|
                    ratings = ratings + r.rate_value
                end
            end
            if ratings_total != 0
                ratings = ratings.to_f/ratings_total.to_f
            end
            return ratings
        else
            return nil
        end
    end

    def payment_method
        @user = User.find(session[:user_id])
    end
    
    def phone_number
        @user = User.find(session[:user_id])
    end

    def authenticate
        user = current_user
        if !user.authenticate(params[:user][:password])
            @error = "Senha incorreta"
            render request.path
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

    def updatephone
        puts('NO PHONE ACTION')
        @user = User.find(session[:user_id])
        if @user.update(phone: params[:user][:phone])
            redirect_to "/user/"
        else 
            @user.errors.each do |attribute, errorMsg|
                puts(errorMsg)
            end
            redirect_to '/user/phone_number'
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
            params.require(:user).permit(:email, :username, :password, :avatar, :password_confirmation, :money, :card, :vr, :pix, :phone)
        end   
end