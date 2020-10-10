Dado('que estou na página do usuário') do
    visit 'user'
  end
  
  Quando('clico em adicionar produto') do
    click_on 'add_product'
  end
  
  Então('o usuário deve ser redirecionado para a página de adicionar produto') do
    visit 'new'
  end
  
  Quando('clico sair') do
    click_on 'logout'
  end
  
  Então('o usuário deve ser redirecionado para a página de login') do
    visit 'login'
  end