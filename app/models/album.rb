class Album < ApplicationRecord
  belongs_to :photographer
  belongs_to :client
  has_many :photos, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
  validates :date, presence: true
  validates :description, length: { maximum: 255 }
  validates :location, length: { maximum: 50 }

  def to_param
    "#{id}-#{title.parameterize}"
  end

def self.all_by_photos
    joins(:photos).group('albums.id').order('count(photos.id) DESC').to_a
  end
end
