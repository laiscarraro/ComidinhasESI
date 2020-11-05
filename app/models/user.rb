class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: { message: "É obrigatório informar o email" },
            format: {with: URI::MailTo::EMAIL_REGEXP, message: "O email informado é inválido"},
            uniqueness: { message: "O email informado já existe"}

  validates :username, presence: { message: "É obrigatório informar o username" }, 
          uniqueness: { message: "O username informado já existe"}

  validates :password, presence: { message: "É obrigatório informar a senha" },
            confirmation: { message: "Senha não corresponde" }

  has_one_attached :avatar

  has_many :ratings
end
