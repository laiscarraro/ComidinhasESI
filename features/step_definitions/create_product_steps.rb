Dado('que estou na página de adição de produto') do
  category = Category.new
  category.name = "Doce"
  category.save
  visit 'product/new'
end

Quando('preencho o campo {string} com {string}') do |string, string2|
  fill_in string, :with => string2 
end

Quando('seleciono a categoria {string}') do |string |
  check(string)
end

Quando('clico em adicionar') do
  click_on "Adicionar"
end

Então('ele deve ter sido salvo no banco de dados') do
  product = Product.order("id").last
  expect(product.name).to eq("Cone")
  expect(product.price).to eq(6.00)
  expect(product.categories[0].name).to eq('Doce')
end

Quando('deixo o campo {string} vazio') do |string|
  fill_in string, :with => ""
end

Então('deverei ver a mensagem de erro {string}') do |string|
  expect(page).to have_content(string)
end
