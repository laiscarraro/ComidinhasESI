Dado('que estou na página de adição de produto') do
  category = Category.new
  category.name = "Doce"
  category.save
  visit 'product/new'
end

Quando('clico em adicionar') do
  click_on "Adicionar"
end

Então('o produto deve ter sido salvo no banco de dados') do
  product = Product.order("id").last
  expect(product.name).to eq("Cone")
  expect(product.price).to eq(6.00)
end

Quando('seleciono a categoria {string}') do |string |
  check(string)
end

Quando('clico em fazer upload de uma foto') do
  attach_file('Foto', File.join(Rails.root, 'public', 'cone.jpg'))
end


