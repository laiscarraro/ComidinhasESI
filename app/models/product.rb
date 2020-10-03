class Product < ApplicationRecord
  validates :name, presence: { message: "É obrigatório informar o nome do produto" }
  validates :price, presence: { message: "É obrigatório informar o preço do produto" },
   format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "O formato de preço é inválido" }, numericality: { greater_than: 0.49, less_than: 10000, message: "O preço precisa ser um número entre R$ 0,50 e R$ 10.000"}
  validates :categories, :length => { :minimum => 1 , message: "Selecione pelo menos uma categoria"}
  has_and_belongs_to_many :categories

  has_attached_file :photo, :styles => {:large => '900x' }, :default_url => "cone.jpg"
  validates :photo, presence: { message: "É obrigatório adicionar uma foto do produto!"}

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
