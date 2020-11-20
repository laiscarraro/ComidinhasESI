
Dado('que estou na página de edição de produto') do
  product = Product.order("id").last
  log(product.photo)
  visit edit_product_path(product)
end

Então('devo ver as informações do produto na tela') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('clico em editar') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('o produto deve ter sido modificado no banco de dados') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('clico em fazer upload de uma foto diferente') do
  pending # Write code here that turns the phrase above into concrete actions
end
