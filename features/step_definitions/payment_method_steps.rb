Dado('que estou na página de usuário') do
    visit 'user'
  end
  
  Quando('clico em adicionar métodos de pagamento') do
    click_on 'payment_method'
  end
  
  Quando('clico nos métodos que eu aceito') do
    check_on 'money'
    check_on 'pix'
  end
  
  Então('eles devem aparecer na minha página de vendedor') do
    pending # Write code here that turns the phrase above into concrete actions
  end