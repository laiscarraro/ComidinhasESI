class ProductController < ApplicationController
  before_action :require_permission, only: :destroy

  def initialize_categories
    @categories = Category.all
  end

  def show
    if @product = Product.find_by(id:params[:id])  
      @user = @product.user   
      @categories = @product.categories  
      render 'description'
    else
      redirect_to root_path
    end  
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
    @product.photo = product_params['photo']

    if product_params.has_key?(:categories)
      @product.categories << Category.find(product_params['categories'])
    end

    @product.user = User.find(session[:user_id])

    if @product.save
      redirect_to root_path
    else 
      initialize_categories
      render 'new'
    end
  end

  # screen
  def edit
    @product = Product.find_by(id:params[:id]) 
    @categories = Category.all
  end

  # function
  def update
    @product = Product.find_by(id:params[:id]) 

    if @product.update(name: params[:product][:name], 
      price: params[:product][:price], 
      description: params[:product][:description])
      redirect_to "/user/"
    else 
      @product.errors.each do |attribute, errorMsg|
          puts(errorMsg)
      end
    end  
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to user_index_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :photo, :user, categories: [])
  end 

end