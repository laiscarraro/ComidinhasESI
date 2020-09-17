class ProductController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    # TODO  - redirecionar usuário para a página do produto
    @product.save
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end
