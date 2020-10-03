require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do 
    @category = Category.new
    @category.name = "Doce"
    @category.save
    @photo = File.open(File.join(Rails.root, 'public', 'cone.jpg'))
  end

  it 'produto valido' do
    product = Product.new
    product.name = "Cone trufado"
    product.price = 6.00
    product.description = "Um delicioso cone trufado!"
    product.categories << @category
    product.photo = @photo
    expect(product).to be_valid
  end

  it 'invalido sem nome' do
    product = Product.new
    product.price = 10.99
    product.description = "salve"
    product.categories << @category
    product.photo = @photo
    expect(product).not_to be_valid
  end

  it 'invalido sem preço' do
    product = Product.new
    product.name = "Cone"
    product.description = "salve"
    product.categories << @category
    product.photo = @photo
    expect(product).not_to be_valid
  end

  it 'invalido sem categorias' do
    product = Product.new
    product.name = "Cone"
    product.description = "salve"
    product.photo = @photo
    expect(product).not_to be_valid
  end

  it 'invalido sem foto' do
    product = Product.new
    product.name = "Cone"
    product.description = "salve"
    expect(product).not_to be_valid
  end

  it 'valido sem descrição' do
    product = Product.new
    product.name = "Cone"
    product.price = 19.5
    product.categories << @category
    product.photo = @photo
    expect(product).to be_valid
  end

  it 'preço string e não número' do
    product = Product.new
    product.name= "Cone"
    product.price = "a,@gmail.com"
    product.description = "salve"
    product.categories << @category
    product.photo = @photo
    expect(product).not_to be_valid
  end

  it 'preço com mais de duas casas decimais' do
    product = Product.new
    product.name= "Cone"
    product.price = 312.213
    product.description = "salve"
    product.categories << @category
    product.photo = @photo
    expect(product).not_to be_valid
  end

  it 'preço com uma casa decimal' do
    product = Product.new
    product.name= "Cone"
    product.price = 10.5
    product.description = "salve"
    product.categories << @category
    product.photo = @photo
    expect(product).to be_valid
  end

  it 'preço com nenhuma casa decimal' do
    product = Product.new
    product.name= "Cone"
    product.price = 15
    product.description = "salve"
    product.categories << @category
    product.photo = @photo
    expect(product).to be_valid
  end

  it 'produto inválido com um preço muito alto' do
    product = Product.new
    product.name = "Cone trufado"
    product.price = 6000000000000.00
    product.description = "Desculpa o preço galera a culpa é do PT :("
    product.categories << @category
    product.photo = @photo
    expect(product).to be_invalid
  end

  it 'produto inválido com um preço muito alto (por pouco)' do
    product = Product.new
    product.name = "Cone trufado premium"
    product.price = 10001.00
    product.description = "Caro? Ah o que importa é a qualidade né"
    product.categories << @category
    product.photo = @photo
    expect(product).to be_invalid
  end

  it 'produto inválido com um preço muito alto (por pouco)' do
    product = Product.new
    product.name = "Cone trufado gourmet"
    product.price = 9999.00
    product.description = "Cone caro sem tompero. Vergonha da profissión!"
    product.categories << @category
    product.photo = @photo
    expect(product).to be_valid
  end

end
