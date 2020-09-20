Dado('que estou na página de adição de produto') do
  visit 'product/new'
end

Quando('preencho o campo {string} com {string}') do |string, string2|
  fill_in string, :with => string2  
end

Quando('clico em adicionar') do
  click_on "Adicionar"
end

Então('ele deve ter sido salvo no banco de dados') do
  product = Product.order("id").last
  expect(product.name).to eq("Cone")
  expect(product.price).to eq(6.00)
  # expect(product.description).to eq("Melhor que o cone do Wilson" || "")
end

Então('deverei ver o produto na página principal') do
  pending
  # expect(page).to have_content("Cone")
  # expect(page).to have_content(6.00)
end

Quando('deixo o campo {string} vazio') do |string|
  fill_in string, :with => ""
end

Então('deverei ver a mensagem de erro {string}') do |string|
  expect(page).to have_content(string)
end
