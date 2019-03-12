class Character < ApplicationRecord

  # actor assosiation through character_records.
  has_many :character_records
  has_many :actors, through: :character_records

  # scope movie_name
  scope :filter_character, -> (name) { where(movie_name: name) }

end
