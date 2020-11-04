Dado('que estou na página do vendedor') do
  visit "/user/1"
end
  
  Quando('clico em voltar') do
    click_on 'voltar'
  end
  
  Então('o usuário deve ser redirecionado para a página anterior') do
    visit page.driver.request.env['HTTP_REFERER']
  end
  
  Dado('o vendedor possui produtos cadastrados') do
    category = Category.new
    category.name = "Categoria para me ajudar a passar em ESI"
    category.save

    photo = fixture_file_upload((File.join(Rails.root, 'public', 'cone.jpg')))

    product1 = Product.new
    product1.name = "Cones do Wilson"
    product1.price = 6.00
    product1.description = "Cone bom para testes!"
    product1.categories << Category.where("name LIKE 'Categoria para me ajudar a passar em ESI'")
    product1.photo = photo
    product1.user = User.find_by({:id => 1})
    product1.save

    visit '/user/1'

  end

  Então('o usuário deve ver os produtos do vendedor') do
    expect(page).to have_content("Cones do Wilson")
  end