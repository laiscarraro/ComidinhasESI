require 'rails_helper'

RSpec.describe "Users", type: :request do
  it "deve mostrar métodos de pagamento do usuário do usuario" do 
    avatar = fixture_file_upload(File.join(Rails.root, 'public', 'estudante.jpg'))
    User.create(username: "Reinaldo do Dogão", email: "reinaldoDoDogao@gmail.com", password: "Rei123", avatar: avatar, vr: true, card: true)

    get '/user/1'
    expect(response).to be_successful
    expect(response.body).to include('<p>VR</p>')
    expect(response.body).to include('<p>Cartão</p>')
  end
end
