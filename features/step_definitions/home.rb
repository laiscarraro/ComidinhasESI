Dado('que estou na página home') do
    category = Category.new
    category.name = "Categoria para me ajudar a passar em ESI"
    category.save

    photo = File.open(File.join(Rails.root, 'public', 'cone.jpg'))

    product1 = Product.new
    product1.name = "Cones do Wilson"
    product1.price = 6.00
    product1.description = "Cone bom para testes!"
    product1.categories << Category.where("name LIKE 'Categoria para me ajudar a passar em ESI'")
    product1.photo = photo
    product1.save

    product2 = Product.new
    product2.name = "Lanches Naturais"
    product2.price = 4.00
    product2.description = "Um lanche para salvar seus projetos!"
    product2.categories << Category.where("name LIKE 'Categoria para me ajudar a passar em ESI'")
    product2.photo = photo
    product2.save

    product3 = Product.new
    product3.name = "Cereais"
    product3.price = 10.00
    product3.description = "Cereais que ajudam você a não trancar o curso!"
    product3.categories << Category.where("name LIKE 'Categoria para me ajudar a passar em ESI'")
    product3.photo = photo
    product3.save

    category = Category.new
    category.name = "Massa"
    category.save

    product4 = Product.new
    product4.name = "Pizza"
    product4.price = 50.00
    product4.description = "Pizzas caseiras e entregues na hora."
    product4.categories << Category.where("name LIKE 'Massa'")
    product4.photo = photo
    product4.save

    visit 'home/index'
  end
  
  Então('deve aparecer para mim todas as comidinhas') do
    expect(page).to have_content("Cones do Wilson")
    expect(page).to have_content("Lanches Naturais")
    expect(page).to have_content("Cereais")
  end
  
  Quando('eu preencho o campo {string} com {string}') do |string, string2|
    fill_in string, :with => string2
  end
  
  E('aperto em pesquisar') do
    click_on 'inspect'
  end
  
  Então('devo ver comidinhas que contenham esse nome como {string}') do |string|
    expect(page).to have_content(string)
  end

  E('não devo ver comidinhas que contenham o nome {string} ou {string}') do |string, string2|
    expect(page).to have_no_content(string)
    expect(page).to have_no_content(string2)
  end
  
  Quando('pesquiso uma comidinha que não existe') do
    fill_in 'search', :with => 'ruby on rails is aweasome'
    click_on 'inspect'
  end
  
  Então('devo ver uma mensagem de {string}') do |string|
    expect(page).to have_content(string)
  end

  Então('devo ver todas as categorias cadastradas') do
    expect(page).to have_content("Categoria para me ajudar a passar em ESI")
    expect(page).to have_content("Massa")
  end

  Quando('aperto a categoria {string}') do |string|
    click_on string
  end

  Então('deve mostrar apenas comidinhas da categoria como {string} e não {string}, {string} ou {string}') do |string, string2, string3, string4|
    expect(page).to have_content(string)
    expect(page).to have_no_content(string2)
    expect(page).to have_no_content(string3)
    expect(page).to have_no_content(string4)
  end