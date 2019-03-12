class Picture < ApplicationRecord

  # scopt the page_type for movie poster or artwork
  scope :type, -> (name) { where(page_type: name) }
end
