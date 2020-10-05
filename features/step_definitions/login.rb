Dado('que estou na tela de login') do
    visit '/login/index'
  end
  
  Quando('eu aperto a barra de usuário') do
    click_on 'user'
  end
  
  Quando('insiro meu nome de usuário {string}') do |string|
    fill_in 'user', :with => string
  end
  
  Quando('aperto a barra de senha') do
    click_on 'password'
  end
  
  Quando('insiro minha senha {string}') do |string|
    fill_in 'password', :with => string
  end
  
  Quando('aperto em login') do
    click_on 'login'
  end
  
  Então('devo estar logado no sistema') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('insiro um usuário errado {string}') do |string|
    fill_in 'user', :with => string
  end
  
  Então('devo ver uma mensagem de erro de usuário') do
    expect(page).to have_content("Usuário inexistente")
  end
  
  Quando('insiro meu nome de usuário correto {string}') do |string|
    fill_in 'user', :with => string
  end
  
  Quando('insiro a senha incorretamente {string}') do |string|
    fill_in 'password', :with => string
  end
  
  Então('devo ver uma mensagem de erro de senha') do
    expect(page).to have_content('Senha incorreta')
  end
  