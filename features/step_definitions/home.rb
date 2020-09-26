Dado('que estou na página home') do
    product1 = Product.new
    product1.name = "Cones do Wilson"
    product1.price = 6.00
    product1.description = "Cone bom para testes!"
    product1.save

    product2 = Product.new
    product2.name = "Lanches Naturais"
    product2.price = 4.00
    product2.description = "Um lanche para salvar seus projetos!"
    product2.save

    product3 = Product.new
    product3.name = "Cereais"
    product3.price = 10.00
    product3.description = "Cereais que ajudam você a não trancar o curso!"
    product3.save

    visit 'home/index'
  end
  
  Então('deve aparecer para mim todas as comidinhas') do
    products = Product.all
    products.each do |product|
      expect(page).to have_content(product.name)
    end
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