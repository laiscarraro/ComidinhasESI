class RatingsController < ApplicationController
    def index
        if session[:user_id] == nil
            redirect_to '/login/index'
        end
    end

    def create
        rating = Rating.new
        rating.rate_value = params['rate_value']
        rating.commentary = params['commentary']
        rating.user = User.find(session[:user_id])
        rating.product = Product.find(params['product_id'])  
        
        if rating.save
            puts('Salvou!')
        else
            puts('Não salvou!')
        end
    end
end