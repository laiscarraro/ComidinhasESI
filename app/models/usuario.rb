class Usuario < ApplicationRecord
    validates :nome, presence: { message: "É obrigatório informar o login" }
    validates :nome, presence: { message: "É obrigatório informar o email" }
end
