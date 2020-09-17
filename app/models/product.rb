class Product < ApplicationRecord
  validates :name, presence: { message: "É obrigatório informar o nome do produto" }
  validates :price, presence: { message: "É obrigatório informar o preço do produto" },
    format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 10000 }
end
