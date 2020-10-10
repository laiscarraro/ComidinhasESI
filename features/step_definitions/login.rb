Dado('que estou na tela de login') do
    user = User.new
    user.username = "usuario"
    user.email = "usuario@usuario"
    user.password = "senha"
    user.save

    visit '/login/index'
  end
  
  Quando('insiro meu nome de usuário {string}') do |string|
    fill_in 'login-user-text', :with => string
  end
  
  Quando('insiro minha senha {string}') do |string|
    fill_in 'login-password-text', :with => string
  end
  
  Quando('aperto em login') do
    click_on 'login-submit-btn'
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
  
  Então('devo ser redirecionado para a página de home') do
    expect(page).to have_current_path(root_path)
  end