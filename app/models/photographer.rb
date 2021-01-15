class Photographer < ApplicationRecord
  has_many :albums
  has_many :clients, through: :albums
  has_secure_password
end
