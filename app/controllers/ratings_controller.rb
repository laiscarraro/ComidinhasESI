class RatingsController < ApplicationController
    def new
        if session[:user_id] == nil
            redirect_to '/login/index'
        end
        @product = Product.find(params['product_id'])  
    end
    
   

    def create
        rating = Rating.new
        rating.rate_value = params['rate_value']
        rating.commentary = params['commentary']
        rating.user = User.find(session[:user_id])
        rating.product = Product.find(params['product_id'])  
        
        if rating.save
            redirect_to product_path(id: params['product_id'])
        else
            error_msg = ActionController::Base.helpers.pluralize(rating.errors.count, "erro")
            error_msg += " na sua avaliação:"
            rating.errors.each do |attribute, error|
                error_msg += "\\n"
                error_msg += error
            end
            
            render js: "alert('"+error_msg+"');"
        end
    end
end