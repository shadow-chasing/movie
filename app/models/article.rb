class Article < ApplicationRecord
  before_save :update_published_at
  before_save :update_unpublished_at

  # assosiations
  belongs_to :user
  belongs_to :category
  belongs_to :category, inverse_of: :articles

  # validations
  validates_presence_of :title
  validates_presence_of :content

  # scopes
   scope :published, -> { where(published: true) }
   scope :unpublished, -> { where(published: false) }
   scope :most_recent, -> { order(published_at: :desc) }


  # methods
  def update_published_at
    self.published_at = Time.now if published == true
  end

  def update_unpublished_at
    self.published_at = nil if published == false
  end

end
