class Album < ApplicationRecord
  belongs_to :photographer
  belongs_to :client
  has_many :photos, dependent: :destroy

  validates :title, presence: true

  def self.with_most_photos
    joins(:photos).group(:album_id).limit(1)
  end
end
