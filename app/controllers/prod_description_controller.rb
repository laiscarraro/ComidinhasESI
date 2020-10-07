class ProdDescriptionController < ApplicationController
    def description
        @categories = Category.all
        @products = Product.all
        render 'description'
    end

    def category
        @categories = Category.all
        /category = Category.find(params[:id])*/   
        render 'description'
    end

end
