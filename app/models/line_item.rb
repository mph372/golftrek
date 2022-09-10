class LineItem < ApplicationRecord
  belongs_to :itinerary, dependent: :destroy
  belongs_to :golf_course
end
