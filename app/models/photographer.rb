class Photographer < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :clients, through: :albums
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def self.with_most_albums(num)
    joins(:albums).group('photographer_id').having("COUNT(*) == #{num}")
  end

  def self.highest_album_count
    joins(:albums).group('photographer_id').count.values[0]
  end
end
