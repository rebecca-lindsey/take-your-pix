class Client < ApplicationRecord
    has_many :albums
    has_many :photographers, through: :albums
    has_secure_password
end
