Dado('que estou na página de usuário') do
    visit 'user'
  end
  
  Quando('clico em adicionar métodos de pagamento') do
    click_on 'payment_method'
  end
  
  Quando('clico nos métodos que eu aceito') do
    check 'vr'
  end
  
  Quando('clico em enviar') do
    click_on 'send'
  end 

  Então('devo ter sido redirecionado para o meu perfil') do
    expect(page).to have_current_path('/user/')
  end

  Então('eles ser atualizados no banco de dados') do
    user = User.order("created_at").first
    expect(user.vr).to eq(true)
  end