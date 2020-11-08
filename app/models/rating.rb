class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :rate_value, presence: { message: "É obrigatório dar uma nota para a avaliação!" }, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true, message: "A avaliação precisa ser um número inteiro entre 1 e 5!"}

  validates :commentary, presence: { message: "A avaliação precisa ter um comentário!" }
end
