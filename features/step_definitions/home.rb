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
  
  Quando('aperto em uma categoria') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('deve mostrar apenas comidinhas da categoria selecionada') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('aperto no icone de explorar') do
    click_link 'explore'
  end
  
  Então('vou para a página explorar') do
    expect(page).to have_current_path('/explore/index')
  end
  
  Quando('aperto no icone de perfil') do
    click_link 'user'
  end
  
  Então('deve mostrar as informações do usuário') do
    expect(page).to have_current_path('/user/index')
  end
  
  Quando('estou sem internet') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('deve mostrar mensagem {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('pesquiso uma comidinha que não existe') do
    fill_in 'search', :with => 'ruby on rails is aweasome'
    click_on 'inspect'
  end
  
  Então('devo ver uma mensagem de {string}') do |string|
    expect(page).to have_content(string)
  end
  
  Quando('escolho uma comidinha') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('vou para a página dessa comidinha') do
    pending # Write code here that turns the phrase above into concrete actions
  end