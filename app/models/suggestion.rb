class Suggestion < ApplicationRecord
  validates :name, presence: { message: "Sugestão está vazia" }
  has_many :suggestion_vote, dependent: :destroy
end
