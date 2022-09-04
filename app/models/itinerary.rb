class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :golf_clubs
end
