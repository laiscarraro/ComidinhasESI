require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it 'invalido sem dados' do
    user = User.new
    expect(user).not_to be_valid
  end

  it 'invalido sem email' do
    user = User.new
    user.username = "teste"
    user.password_digest = "senha"
    expect(user).not_to be_valid
  end

  it 'invalido sem email e username' do
    user = User.new
    user.password_digest = "senha"
    expect(user).not_to be_valid
  end

  it 'invalido sem username' do
    user = User.new
    user.email = "teste@gmail.com"
    user.password_digest = "senha"
    expect(user).not_to be_valid
  end

  it 'invalido sem senha' do
    user = User.new
    user.email = "teste@gmail.com"
    user.username = "teste"
    expect(user).not_to be_valid
  end

  it 'invalido sem senha e email' do
    user = User.new
    user.username = "teste"
    expect(user).not_to be_valid
  end

  it 'invalido username e senha' do
    user = User.new
    user.email = "teste@gmail.com"
    expect(user).not_to be_valid
  end

end
