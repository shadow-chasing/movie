class Genre < ApplicationRecord
  has_many :genre_records
  has_many :movies, through: :genre_records

end
