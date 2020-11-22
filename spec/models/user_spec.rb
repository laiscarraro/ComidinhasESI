require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @avatar = fixture_file_upload(File.join(Rails.root, 'public', 'estudante.jpg'))
  end

  context 'usuario valido' do
    it 'deveria considerar o usuario como valido' do
      user = User.new
      user.username = "Reinaldo do Dogão"
      user.email = "reinaldoDoDogao@gmail.com"
      user.password = "Rei123"
      user.avatar = @avatar
      expect(user).to be_valid
    end
  end

  context 'invalido sem dados' do
    it 'deveria considerar o usuario como invalido' do
      user = User.new
      expect(user).not_to be_valid
    end
  end

  context 'invalido sem email' do
    it 'deveria considerar o usuario como invalido' do
      user = User.new
      user.username = "teste"
      user.password = "senha"
      expect(user).not_to be_valid
    end
  end

  context 'invalido sem username' do
    it 'deveria considerar o usuario como invalido' do
      user = User.new
      user.email = "teste@gmail.com"
      user.password = "senha"
      expect(user).not_to be_valid
    end
  end

  context 'invalido sem senha' do
    it 'deveria considerar o usuario como invalido' do
      user = User.new
      user.email = "teste@gmail.com"
      user.username = "teste"
      expect(user).not_to be_valid
    end
  end

  context 'valido sem avatar' do
    it 'deveria considerar o usuario como valido' do
      user = User.new
      user.username = "Reinaldo do Dogão"
      user.email = "reinaldoDoDogao@gmail.com"
      user.password = "Rei123"
      expect(user).to be_valid
    end
  end

  context 'sem produtos' do
    it 'deveria retornar a contagem de produtos como zero' do
      user = User.new
      user.username = "Reinaldo do Dogão"
      user.email = "reinaldoDoDogao@gmail.com"
      user.password = "Rei123"
      user.id = 1
      expect(Product.joins(:user).where("user_id = #{user.id}").count).to eq(0)
    end
  end
end