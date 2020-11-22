Quando('pelo menos um produto possui pelo menos uma avaliação') do
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

    product2 = Product.new
    product2.name = "Cones do Wilson"
    product2.price = 6.00
    product2.description = "Cone bom para testes!"
    product2.categories << Category.where("name LIKE 'Categoria para me ajudar a passar em ESI'")
    product2.photo = photo
    product2.user = User.find_by({:id => 1})
    product2.save

    rating1 = Rating.new
    rating1.rate_value = 5
    rating1.commentary = "top"
    rating1.user = User.find_by({:id => 1})
    rating1.product = Product.joins(:user).where("user_id = 1").last
    rating1.save

    rating2 = Rating.new
    rating2.rate_value = 2
    rating2.commentary = "meh"
    rating2.user = User.find_by({:id => 1})
    rating2.product = Product.joins(:user).where("user_id = 1").first
    rating2.save

    rating3 = Rating.new
    rating3.rate_value = 3
    rating3.commentary = "mais ou menos"
    rating3.user = User.find_by({:id => 1})
    rating3.product = Product.joins(:user).where("user_id = 1").first
    rating3.save

    visit '/user/1'
end
  
Então('devo ver a média de todas as avaliações') do
    expect(page).to have_content((10.0/3.0).to_s)
end
  
Quando('todos os produtos não possuem avaliações') do
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

    expect(@ratings).to eq(nil)

    visit '/user/1'
end
  
Então('devo ver {string} no campo da média de avaliações') do |string|
    expect(page).to have_content("#{string}")
end
  
Dado('o vendedor não possui produtos cadastrados') do
    expect(@products).to eq(nil)
end