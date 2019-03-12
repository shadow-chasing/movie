class CharacterRecord < ApplicationRecord
  belongs_to :character
  belongs_to :actor
end
