class ProductController < ApplicationController
  def initialize_categories
    @categories = Category.all
  end

  def new
    @product = Product.new
    initialize_categories
  end

  def create
    @product = Product.new

    @product.name = product_params['name']
    @product.price = product_params['price']
    @product.description = product_params['description']

    if product_params.has_key?(:categories)
      @product.categories << Category.find(product_params['categories'])
    end

    if @product.save
      redirect_to root_path
    else 
      initialize_categories
      render 'new'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, categories: [])
  end
end
