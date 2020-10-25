Dado('que estou na página do vendedor') do
  visit 'user/id'
  end
  
  Quando('clico em voltar') do
    click_on 'voltar'
  end
  
  Então('o usuário deve ser redirecionado para a página anterior') do
    expect(page).to have_current_path(request.referrer)
  end
  
  Quando('clico no produto com id {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('o usuário deve ser redirecionado para a página do produto {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end