class HomeController < ApplicationController
    def index
        @products = Product.all
    end

    def search
        @products = Product.where("name LIKE ?","%"+params[:prodname]+"%")     
        render 'index'
    end
end