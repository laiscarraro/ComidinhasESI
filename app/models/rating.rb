class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :rate_value, presence: { message: "É obrigatório dar uma nota para a avaliação!" }

  validates :commentary, presence: { message: "A avaliação precisa ter um comentário!" }
end
