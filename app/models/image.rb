class Image < ApplicationRecord
  belongs_to :imageable, :polymorphic => true 

  belongs_to :movie
  belongs_to :actor
end
