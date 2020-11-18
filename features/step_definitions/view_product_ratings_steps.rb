Capybara.current_driver = :selenium

Dado('há avaliações cadastradas') do
    rating1 = Rating.new
    rating1.rate_value = 5
    rating1.commentary = 'Excelente!'
    rating1.user = User.find_by(username: 'Reinaldo do Dogão')
    rating1.product = Product.find_by(name: 'Cones do Wilson')
    rating1.save

    user = User.new
    user.username = "Carlos Churrascão"
    user.email = "churrascao@churrascao"
    user.password = "churrascodecarne"
    user.avatar = fixture_file_upload((File.join(Rails.root, 'public', 'cone.jpg')))
    user.save

    rating2 = Rating.new
    rating2.rate_value = 1
    rating2.commentary = 'Hoje o produto estava péssimo!'
    rating2.user = User.find_by(username: 'Carlos Churrascão')
    rating2.product = Product.find_by(name: 'Cones do Wilson')
    rating2.save
  end
  
  Então('devo ver as avaliações do produto') do
    expect(page).to have_current_path(product_ratings_path(product_id: Product.find_by(name: 'Cones do Wilson').id))
    expect(page).to have_css('#username_1', text: 'Reinaldo do Dogão')
    expect(page).to have_css('#rate_value_1', text: '5')
    expect(page).to have_content('Excelente!')
    expect(page).to have_css('#username_2', text: 'Carlos Churrascão')
    expect(page).to have_css('#rate_value_2', text: '1')
    expect(page).to have_content('Hoje o produto estava péssimo!')
  end
  
  Então('devo ver a mensagem {string}') do |string|
    expect(page).to have_current_path(product_ratings_path(product_id: Product.find_by(name: 'Cones do Wilson').id))
    expect(page).to have_content(string)
  end

Capybara.use_default_driver