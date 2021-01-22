class Photo < ApplicationRecord
  belongs_to :album
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 255 }
  validates :location, length: { maximum: 50 }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
