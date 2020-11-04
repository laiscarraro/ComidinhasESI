class RatingsController < ApplicationController
    def create
        product = Product.find(params[:product_id])
        product.ratings.create(rating_params)
    end

    private
        def rating_params
            params.require(:rating).permit(:rate_value, :commentary)
        end
end
