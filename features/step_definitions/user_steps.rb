Dado('que estou na página do usuário') do
    visit 'user'
  end
  
  Quando('clico em adicionar produto') do
    click_on 'create_product'
  end
  
  Então('o usuário deve ser redirecionado para a página de adicionar produto') do
    vistit 'product/new'
  end
  
  Quando('clico em produto') do
    click_on 'product'
  end
  
  Então('o usuario deve ser redirecionado para a página do produto') do
    #visit 'product'
  end
  
  Quando('clico sair') do
    click_on 'logout'
  end
  
  Então('o usuário deve ser redirecionado para a página de login') do
    #visit 'login'
  end