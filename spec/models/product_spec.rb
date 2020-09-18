require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'invalido sem nome' do
    product = Product.new
    product.price = 10.99
    product.description = "salve"
    expect(product).not_to be_valid
  end

  it 'invalido sem preço' do
    product = Product.new
    product.name = "Cone"
    product.description = "salve"
    expect(product).not_to be_valid
  end

  it 'valido sem descrição' do
    product = Product.new
    product.name = "Cone"
    product.price = 19.5
    expect(product).to be_valid
  end

  it 'preço string e não número' do
    product = Product.new
    product.name= "Cone"
    product.price = "a,@gmail.com"
    product.description = "salve"
    expect(product).not_to be_valid
  end

  it 'preço com mais de duas casas decimais' do
    product = Product.new
    product.name= "Cone"
    product.price = 312.213
    product.description = "salve"
    expect(product).not_to be_valid
  end

  it 'preço com uma casa decimal' do
    product = Product.new
    product.name= "Cone"
    product.price = 10.5
    product.description = "salve"
    expect(product).to be_valid
  end

  it 'preço com nenhuma casa decimal' do
    product = Product.new
    product.name= "Cone"
    product.price = 15
    product.description = "salve"
    expect(product).to be_valid
  end
end
