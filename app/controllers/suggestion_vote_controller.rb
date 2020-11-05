class SuggestionVoteController < ApplicationController
  before_action :authorized, only: [:create]

  def create
    @suggestion.
  end

  private
  def suggestion_params
    params.require(:suggestion_vote).permit(:name)
  end

  def find_suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
  end
end
