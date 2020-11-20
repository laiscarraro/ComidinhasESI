
Dado('que estou na página de edição de produto') do
  product = Product.order("id").last
  visit edit_product_path(product)
end

Então('devo ver as informações do produto na tela') do
  product = Product.order("id").last
  expect(page).to have_content(product.description)
end

Quando('clico em salvar') do
  click_on 'salvar'
end

Então('o produto deve ter sido modificado no banco de dados') do
  product = Product.order("id").last
  expect(product.name).to eq('Casca de Sorvete')
end

Quando('clico em fazer upload de uma foto diferente') do
  attach_file('Foto', File.join(Rails.root, 'public', 'casca.jpg'))
end

Então('o produto deve ter tido a imagem mudada no banco de dados') do
  product = Product.order("id").last
  log(product.photo)
end