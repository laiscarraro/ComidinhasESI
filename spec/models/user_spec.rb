require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it 'valido' do
    user = User.new
    user.email = "teste@gmail.com"
    user.username = "teste"
    user.password_digest = "senha"
    check('termos')
    expect(user).to be_valid
  end

  it 'invalido sem dados' do
    user = User.new
    uncheck 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem email' do
    user = User.new
    user.username = "teste"
    user.password_digest = "senha"
    check 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem email e termos' do
    user = User.new
    user.username = "teste"
    user.password_digest = "senha"
    uncheck 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem email, termos e username' do
    user = User.new
    user.password_digest = "senha"
    uncheck 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem username' do
    user = User.new
    user.email = "teste@gmail.com"
    user.password_digest = "senha"
    check 'termos' 
    expect(user).not_to be_valid
  end

  it 'invalido sem username e termos' do
    user = User.new
    user.email = "teste@gmail.com"
    user.password_digest = "senha"
    uncheck 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem senha' do
    user = User.new
    user.email = "teste@gmail.com"
    user.username = "teste"
    check 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem senha e email' do
    user = User.new
    user.username = "teste"
    check 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem senha, email e termos' do
    user = User.new
    user.username = "teste"
    uncheck 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem termos' do
    user = User.new
    user.email = "teste@gmail.com"
    user.username = "teste"
    user.password_digest = "senha"
    uncheck 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem termos e senha' do
    user = User.new
    user.email = "teste@gmail.com"
    user.username = "teste"
    uncheck 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido username, email e senha' do
    user = User.new
    check 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem termos e username' do
    user = User.new
    user.email = "teste@gmail.com"
    user.password_digest = "senha"
    check 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem termos e username' do
    user = User.new
    user.email = "teste@gmail.com"
    user.password_digest = "senha"
    check 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem termos, username e senha' do
    user = User.new
    user.email = "teste@gmail.com"
    uncheck 'termos'
    expect(user).not_to be_valid
  end

  it 'invalido sem senha e username' do
    user = User.new
    user.email = "teste@gmail.com"
    check 'termos'
    expect(user).not_to be_valid
  end

end
