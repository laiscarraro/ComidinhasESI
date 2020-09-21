class HomeController < ApplicationController
    def index
        @products = Product.all
    end

    def show
        @products = Product.find_by(name: params[:name])
        render 'index'
    end
end