class Suggestion < ApplicationRecord
  validates :name, presence: { message: "Sugestão está vazia" }
end
