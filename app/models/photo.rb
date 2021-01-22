class Photo < ApplicationRecord
  belongs_to :album
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 30,
    too_long: "Photo title must be less than 30 characters" }

    def to_param
    "#{id}-#{title.parameterize}"
  end
end
