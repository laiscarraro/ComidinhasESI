Capybara.current_driver = :selenium

Dado('que estou na tela do produto') do
    category = Category.new
    category.name = "Categoria para me ajudar a passar em ESI"
    category.save

    photo = fixture_file_upload((File.join(Rails.root, 'public', 'cone.jpg')))

    user = User.new
    user.username = "Reinaldo do Dogão"
    user.email = "reinaldoDoDogao@gmail.com"
    user.password = "Rei123"
    user.avatar = photo
    user.save

    product = Product.new
    product.name = "Cones do Wilson"
    product.price = 6.00
    product.description = "Cone bom para testes!"
    product.categories << Category.where("name LIKE 'Categoria para me ajudar a passar em ESI'")
    product.photo = photo
    product.user = user
    product.save

    visit product_path(product)
  end
  
  Quando('aperto em {string}') do |string|
    click_on string
  end
  
  Então('devo ser redirecionado para página de login') do
    expect(page).to have_current_path(login_index_path)
  end
  
  Dado('logado no sistema') do
    my_user = User.new
    my_user.username = "eu"
    my_user.email = "eu@eu"
    my_user.password = "eu"
    my_user.avatar = fixture_file_upload((File.join(Rails.root, 'public', 'cone.jpg')))
    my_user.save

    visit login_index_path

    fill_in 'login-user-text', :with => 'eu'
    fill_in 'login-password-text', :with => 'eu'
    click_on 'login-submit-btn'

    visit product_path(Product.find_by(name: 'Cones do Wilson'))
  end
  
  Quando('faço uma avaliação com comentário {string}') do |string|
    choose 'rate_value_5'
    fill_in 'commentary', :with => string
    click_on 'submit-rating-btn'
  end
  
  Então('devo ser redirecionado para a página de produto') do
    expect(page).to have_current_path(product_path(Product.find_by(name: 'Cones do Wilson')))
  end
  
  Quando('faço uma avaliação sem escrever um comentário') do
    choose 'rate_value_3'
    click_on 'submit-rating-btn'
  end
  
  Então('devo ver uma mensagem de erro {string}') do |string|
    expect(page).to have_current_path(product_ratings_path(product_id: Product.find_by(name: 'Cones do Wilson').id))
    expect(page).to have_content(string)
  end
  
  Quando('não faço uma avaliação e escrevo um comentário {string}') do |string|
    fill_in 'commentary', :with => string
    click_on 'submit-rating-btn'
  end
  
  Quando('não faço uma avaliação nem escrevo um comentário') do
    click_on 'submit-rating-btn'
  end

  Capybara.use_default_driver