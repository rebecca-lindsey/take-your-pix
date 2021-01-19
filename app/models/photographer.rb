class Photographer < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :clients, through: :albums
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, :password_digest, presence: true

  def self.from_omniauth(response)
    Photographer.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |p|
      p.email = response[:info][:email]
      p.username = response[:info][:name]
      p.password = SecureRandom.hex(15)
    end
  end
end
