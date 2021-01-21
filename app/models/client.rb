class Client < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :photographers, through: :albums
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def self.with_most_photographers(num)
    joins(:photographers).group('client_id').having("COUNT(*) == #{num}")
  end

  def self.highest_photographer_count
    joins(:photographers).group('client_id').count.values[0]
  end
end
