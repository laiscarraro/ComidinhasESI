require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'invalido sem nome' do
    product = Product.new
    product.price = 10.99
    expect(product).not_to be_valid
  end

  it 'invalido sem preço' do
    product = Product.new
    product.name = "Cone"
    expect(product).not_to be_valid
  end

  it 'preço string e não número' do
    product = Product.new
    product.name= "Cone"
    product.price = "a,@gmail.com"
    expect(product).not_to be_valid
  end

  it 'preço com mais de duas casas decimais' do
    product = Product.new
    product.name= "Cone"
    product.price = 312.213
    expect(product).not_to be_valid
  end
end
