Dado('que estou na paǵina de cadastro de usuário') do
    visit 'user/new'
  end
  
  Quando('preencho o campo {string} com {string}') do |string, string2|
    fill_in string, :with => string2
  end
  
  Quando('clico termos') do
    check 'termos'
  end
  
  Quando('clico em criar') do
    click_on 'criar'
  end
  
  Então('ele deve ter sido salvo no banco de dados') do
    user = User.order("id").last
    expect(User.username).to eq('Maria')
    expect(User.email).to eq('maria@usp.br')
    expect(User.senha).to eq('senha123')
  end
  
  Então('ser redirecionado para a home') do
    visit 'home'
  end
  
  Dado('que estou na página de cadastro de usuário') do
    visit 'user/new'
  end
  
  Quando('deixo o campo {string} vazio') do |string|
    fill_in string, :with => ""
  end
  
  Então('deverei ver a mensagem de erro {string}') do |string|
    expect(page).to have_content(string)
  end

  Quando('não clico em termos') do
    uncheck 'termos'
  end

  Quando('clico em termos') do
    check 'termos'
  end
  