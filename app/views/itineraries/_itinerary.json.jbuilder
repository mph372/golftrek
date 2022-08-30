json.extract! itinerary, :id, :title, :start_date, :end_date, :user_id, :public_itinerary, :created_at, :updated_at
json.url itinerary_url(itinerary, format: :json)
