require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @avatar = fixture_file_upload(File.join(Rails.root, 'public', 'estudante.jpg'))
  end

  it 'usuario valido' do
    user = User.new
    user.username = "Reinaldo do Dogão"
    user.email = "reinaldoDoDogao@gmail.com"
    user.password = "Rei123"
    user.avatar = @avatar
    expect(user).to be_valid
  end

  it 'invalido sem dados' do
    user = User.new
    expect(user).not_to be_valid
  end

  it 'invalido sem email' do
    user = User.new
    user.username = "teste"
    user.password = "senha"
    expect(user).not_to be_valid
  end

  it 'invalido sem username' do
    user = User.new
    user.email = "teste@gmail.com"
    user.password = "senha"
    expect(user).not_to be_valid
  end

  it 'invalido sem senha' do
    user = User.new
    user.email = "teste@gmail.com"
    user.username = "teste"
    expect(user).not_to be_valid
  end

  it 'valido sem avatar' do
    user = User.new
    user.username = "Reinaldo do Dogão"
    user.email = "reinaldoDoDogao@gmail.com"
    user.password = "Rei123"
    expect(user).to be_valid
  end

end