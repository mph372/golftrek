json.extract! golf_course, :id, :course_id, :club_id, :course_name, :holes, :par, :course_type, :course_architect, :open_date, :guest_policy, :currency, :weekday_price, :weekend_price, :twilight_price, :fairway, :green, :last_update, :created_at, :updated_at
json.url golf_course_url(golf_course, format: :json)
