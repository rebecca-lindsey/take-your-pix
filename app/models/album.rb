class Album < ApplicationRecord
  belongs_to :photographer
  belongs_to :client
  has_many :photos, dependent: :destroy
end
