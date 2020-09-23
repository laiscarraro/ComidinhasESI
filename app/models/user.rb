class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: { message: "É obrigatório informar o email" },
            format: {with: URI::MailTo::EMAIL_REGEXP, message: "O email informado é inválido"}

  validates :username, presence: { message: "É obrigatório informar o username" }

  validates :username, presence: true, uniqueness: { message: "O username informado já existe"}

  validates :password, presence: { message: "É obrigatório informar a senhha" },
            length: { minimum: 8 }

  validates_confirmation_of :password, message: 'Senha não corresponde'

  validates :termos, acceptance: { message: "É obrigatório aceitar os termos e condições"}
end
