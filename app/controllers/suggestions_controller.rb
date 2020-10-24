class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestion.all
    @suggestion = Suggestion.new
  end  

  def create
    @suggestion = Suggestion.new
    @suggestion.name = suggestions_params[:name]
    @suggestion.save
  end

  private
  def suggestions_params
    params.require(:suggestion).permit(:name)
  end 
end
