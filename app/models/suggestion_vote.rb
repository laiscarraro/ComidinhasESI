class SuggestionVote < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion, counter_cache: true
end
