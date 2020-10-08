class HomeController < ApplicationController

    def self.prodesc
        @prod_desc = Product.find_by(id:params[:id])
        @cat_desc = @prod_desc.categories  
        render 'description'        
    end

    def index
        @categories = Category.all
        @products = Product.all
    end

    def search
        @categories = Category.all
        @products = Product.where("name LIKE ?","%"+params[:prodname]+"%")     
        render 'index'
    end

    def category
        @categories = Category.all
        category = Category.find(params[:id])
        @products = category.products

        render 'index'
    end
    
end