class ProductController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      # TODO  - redirecionar usuário para a página do produto
    else 
      render 'new'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end