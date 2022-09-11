class LineItem < ApplicationRecord
  belongs_to :itinerary
  belongs_to :golf_course

  def set_date
    if itinerary.line_items.count == 0
      update(date: itinerary.start_date)
    end
  end

  def set_itinerary_date
    update(date: itinerary.start_date)
  end
end
