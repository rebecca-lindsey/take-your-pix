class Album < ApplicationRecord
  belongs_to :photographer
  belongs_to :client
  has_many :photos, dependent: :destroy

  validates :title, presence: true

  def self.with_most_photos; end
end
