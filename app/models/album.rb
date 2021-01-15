class Album < ApplicationRecord
  belongs_to :photographer
  belongs_to :client
end
