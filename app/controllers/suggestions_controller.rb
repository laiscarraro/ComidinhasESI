class SuggestionsController < ApplicationController
  def index

  end  

  def create
    @suggestion = Suggestion.new
    @suggestion.name = suggestion_params['name']
    @suggestion.save
  end

  private
  def suggestion_params
    params.require(:suggestion).permit(:name)
  end 
end
