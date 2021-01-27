class Album < ApplicationRecord
  belongs_to :photographer
  belongs_to :client
  has_many :photos, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
  validates :date, presence: true
  validates :description, length: { maximum: 255 }
  validates :location, length: { maximum: 50 }

  scope :all_by_photos, -> { joins(:photos).group('albums.id').order('count(photos.id) DESC') }

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def self.select_top
    num = all_by_photos.first.photos.count
    joins(:photos).group('albums.id').having("count(photos.id) == #{num}")
  end
end
