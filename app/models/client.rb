class Client < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :photographers, through: :albums
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def self.with_most_albums
    joins(:albums).group(:client_id)
  end
end
