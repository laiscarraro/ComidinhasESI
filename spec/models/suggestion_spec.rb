require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  it 'sugestão válida' do
    suggestion = Suggestion.new
    suggestion.name = "Cone trufado"
    expect(suggestion).to be_valid
  end

  it 'sugestão inválida' do
    suggestion = Suggestion.new
    expect(suggestion).not_to be_valid
  end
end
