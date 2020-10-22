Dado('que estou na página do produto') do
    category = Category.new
    category.name = "Doce"
    category.save

    photo = fixture_file_upload((File.join(Rails.root, 'public', 'cone.jpg')))

    product1 = Product.new
    product1.name = "Cones do Wilson"
    product1.price = 6.00
    product1.description = "Cone bom para testes!"
    product1.categories << Category.where("name LIKE 'Doce'")
    product1.photo = photo

    user = User.new
    user.username = "Reinaldo do Dogão"
    user.email = "reinaldoDoDogao@gmail.com"
    user.password = "Rei123"
    user.avatar = photo
    user.save

    product1.user = user
    
    product1.save       

    visit "product/#{product1.id}"
  end  
  Então('devo ver as informações atreladas ao produto') do   
      expect(page).to have_content("Cones do Wilson")
      expect(page).to have_content(6.00)
      expect(page).to have_content("Cone bom para testes!")
      expect(page).to have_content("Doce")     
  end    

  
