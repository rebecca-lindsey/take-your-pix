class Client < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :photographers, through: :albums
  has_secure_password

  validates :email, presence: true, uniqueness: true, on: :create
  validates :email, presence: true, on: :update
  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :password_digest, presence: true
  validates :location, length: { maximum: 50 }

  before_save { email.downcase! }

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

  def self.all_by_albums
    joins(:albums).group('clients.id').order('count(albums.id) DESC')
  end

  def self.select_top
    num = all_by_albums.to_a.first.albums.count
    joins(:albums).group('clients.id').having("count(albums.id) == #{num}")
  end
end
