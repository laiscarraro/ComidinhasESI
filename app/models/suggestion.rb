class Suggestion < ApplicationRecord
  validates :name, presence: { message: "Sugestão está vazia" }
  has_many :suggestion_votes, dependent: :destroy 
end
