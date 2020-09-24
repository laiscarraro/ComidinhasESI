class ProductController < ApplicationController
  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new

    @product.name = product_params['name']
    @product.price = product_params['price']
    @product.description = product_params['description']

    product_params['categories'].each { |category_id|
      @product.categories << Category.find(category_id)
    }

    if @product.save
      redirect_to root_path
    else 
      render 'new'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, categories: [])
  end
end
