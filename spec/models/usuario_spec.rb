require 'rails_helper'
require 'spec_helper'

RSpec.describe Usuario, type: :model do
  it 'invalido sem login' do
    usuario = Usuario.new
    usuario.email = "teste@usp.br"
    usuario.senha = "senhateste"
    expect(usuario).not_to be_valid
  end
  
end
