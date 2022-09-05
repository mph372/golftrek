class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :golf_clubs
  has_many :line_items
end
