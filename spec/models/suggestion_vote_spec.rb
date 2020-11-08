require 'rails_helper'

RSpec.describe SuggestionVote, type: :model do
  before(:each) do 
    @suggestion = Suggestion.new
    @suggestion.name = "Cone trufado"
    @suggestion.save

    avatar = fixture_file_upload(File.join(Rails.root, 'public', 'estudante.jpg'))

    @user = User.new
    @user.username = "Reinaldo do Dogão"
    @user.email = "reinaldoDoDogao@gmail.com"
    @user.password = "Rei123"
    @user.avatar = avatar
    @user.save
  end

  it 'votar na sugestão válido' do
    suggestion_vote = SuggestionVote.new
    suggestion_vote.user = @user
    suggestion_vote.suggestion = @suggestion
    expect(suggestion_vote).to be_valid
  end

  it 'votar na sugestão inválido sem user' do
    suggestion_vote = SuggestionVote.new
    suggestion_vote.suggestion = @suggestion
    expect(suggestion_vote).not_to be_valid
  end

  it 'votar na sugestão inválido sem sugestão' do
    suggestion_vote = SuggestionVote.new
    suggestion_vote.user = @user
    expect(suggestion_vote).not_to be_valid
  end
end
