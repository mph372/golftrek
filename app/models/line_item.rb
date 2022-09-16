class LineItem < ApplicationRecord
  include RailsSortable::Model
  belongs_to :itinerary, optional: true
  belongs_to :golf_course, optional: true
  belongs_to :favorite_course, optional: true
  set_sortable :position

  def set_date
    if itinerary.line_items.count == 0
      update(date: itinerary.start_date)
    end
  end

  def full_address
    [address, city, state, zip, country].compact.join(', ')
  end

  def line_item_address
    if golf_course.present?
      golf_course.golf_club.full_address
    else
      full_address
    end
  end

  def set_itinerary_date
    update(date: itinerary.start_date)
  end
end
