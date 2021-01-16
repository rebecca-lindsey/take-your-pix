class Client < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :photographers, through: :albums
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, :password, :password_confirmation, :location, presence: true
end
