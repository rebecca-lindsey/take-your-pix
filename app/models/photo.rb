class Photo < ApplicationRecord
  belongs_to :album
  has_one_attached :image

  validates :title, presence: true
end
