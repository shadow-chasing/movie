class Movie < ApplicationRecord
  has_many :actor_records
  has_many :actors, through: :actor_records

  has_many :genre_records
  has_many :genres, through: :genre_records

  has_many :director_records
  has_many :directors, through: :director_records

  has_many :pictures, :as => :imageable
  
# form genre
  def genre_list
    genres.map(&:name).join(', ')
  end

  def genre_list=(names)
    self.genres = names.split(',').map do |n|
      Genre.where(name: n.strip).first_or_create!
    end
  end

# form actor
  def actor_list
    actors.map(&:name).join(', ')
  end

  def actor_list=(names)
    self.actors = names.split(',').map do |n|
      Actor.where(name: n.strip).first_or_create!
    end
  end

# form director
  def director_list
    directors.map(&:name).join(', ')
  end

  def director_list=(names)
    self.directors= names.split(',').map do |n|
      Director.where(name: n.strip).first_or_create!
    end
  end

end
