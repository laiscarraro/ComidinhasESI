class SuggestionVoteController < ApplicationController
  before_action :authorized, only: [:create]
  before_action :find_suggestion, only: [:create]

  def create
    suggestion_vote = SuggestionVote.new
    suggestion_vote.user = current_user
    suggestion_vote.suggestion = @suggestion
    @suggestion.suggestion_votes << suggestion_vote
    redirect_to suggestions_path
  end

  private
  def suggestion_params
    params.require(:suggestion_vote).permit(:suggestion_id)
  end

  def find_suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
  end
end
