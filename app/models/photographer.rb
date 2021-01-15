class Photographer < ApplicationRecord
  has_many :albums
  has_many :clients, through: :albums
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, :password, :password_confirmation, :location, :specialty, presence: true

end
