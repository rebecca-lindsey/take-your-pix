class Photographer < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :clients, through: :albums
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :password_digest, presence: true
  validates :location, length: { maximum: 50 }

  def to_param
    "#{id}-#{username.parameterize}"
  end

  def self.from_omniauth(response)
    find_or_create_by(uid: response[:uid], provider: response[:provider]) do |p|
      p.email = response[:info][:email]
      p.username = response[:info][:name]
      p.password = SecureRandom.hex(15)
    end
  end

  def self.with_most_albums(num)
    joins(:albums).group('photographer_id').having("COUNT(*) == #{num}")
  end

  def self.highest_album_count
    joins(:albums).group('photographer_id').order('count_all DESC').limit(1).count.values[0]
  end
end
