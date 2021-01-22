class Album < ApplicationRecord
  belongs_to :photographer
  belongs_to :client
  has_many :photos, dependent: :destroy

  validates :title, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def self.with_most_photos(num)
    joins(:photos).group('album_id').having("COUNT(*) == #{num}")
  end

  def self.highest_photo_count
    joins(:photos).group('album_id').count.values[0]
  end
end
