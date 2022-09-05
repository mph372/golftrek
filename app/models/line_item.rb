class LineItem < ApplicationRecord
  belongs_to :itinerary
  belongs_to :golf_club
end
