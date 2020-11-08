class SuggestionVote < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :suggestion, counter_cache: true, required: true
end
