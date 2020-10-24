class SuggestionsController < ApplicationController

  def initialize_suggestions
    @suggestions = Suggestion.all
  end

  def index
    initialize_suggestions
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new
    @suggestion.name = suggestions_params[:name]
    if @suggestion.save
      redirect_to '/suggestions'
    else
      initialize_suggestions
      render 'index'
    end
  end

  private
  def suggestions_params
    params.require(:suggestion).permit(:name)
  end 
end
