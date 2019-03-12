class ActorRecord < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
end
