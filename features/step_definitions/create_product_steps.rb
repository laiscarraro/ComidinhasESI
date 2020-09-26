Dado('que estou na página de adição de produto') do
  category = Category.new
  category.name = "Doce"
  category.save
  visit 'product/new'
end

Quando('clico em adicionar') do
  click_on "Adicionar"
end

Então('deverei ver o produto na página principal') do
  # TODO
  # expect(page).to have_content("Cone")
  # expect(page).to have_content(6.00)
end

Então('o produto deve ter sido salvo no banco de dados') do
  product = Product.order("id").last
  expect(product.name).to eq("Cone")
  expect(product.price).to eq(6.00)
  # expect(product.description).to eq("Melhor que o cone do Wilson" || "")
end



