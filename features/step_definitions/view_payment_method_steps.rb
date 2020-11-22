Dado('que estou na página de um vendedor') do
  photo = fixture_file_upload((File.join(Rails.root, 'public', 'cone.jpg')))

  @user = User.new
  @user.username = "Reinaldo do Dogão"
  @user.email = "reinaldoDoDogao@gmail.com"
  @user.password = "Rei123"
  @user.avatar = photo
  @user.save

  visit '/user/1'
end

Dado('que ele aceita o método de pagamento VR e cartão') do
  @user.update(vr: true, card: true)
  visit current_path
end

Então('devo ver o método {string} na página') do |string|
  expect(page).to have_content(string)
end

Dado('aceito os métodos de pagamento VR e Cartão') do
  @user = User.first
  @user.update(vr: true, card: true)
  visit current_path
end


