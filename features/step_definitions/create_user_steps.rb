Dado('que estou na paǵina de cadastro de usuário') do
    visit 'user/new'
  end
  
  Quando('clico termos') do
    check 'termos'
  end

  Quando('clico em fazer upload de um avatar') do
    attach_file('avatar', File.join(Rails.root, 'public', 'estudante.jpg'))
  end
  
  Quando('clico em criar') do
    click_on 'create'
  end
  
  Então('ser redirecionado para o login') do
    expect(page).to have_current_path("/login/index")
  end
  
  Dado('que estou na página de cadastro de usuário') do
    visit 'user/new'
  end

  Quando('não clico em termos') do
    uncheck 'termos'
  end

  Quando('clico em termos') do
    check 'termos'
  end
  
  Então('o usuario deve ter sido salvo no banco de dados') do
    user = User.order("id").last
    expect(user.email).to eq('maria@usp.br')
    expect(user.username).to eq('Maria')
  end