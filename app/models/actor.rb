class Actor < ApplicationRecord

  # movies assosiation through actor_records.
  has_many :actor_records
  has_many :movies, through: :actor_records

  # charactor assosiation through character_records.
  has_many :character_records
  has_many :characters, through: :character_records

  # picture assosiation through imageable pollymorphic assosiation.
  has_many :pictures, :as => :imageable

  
end
