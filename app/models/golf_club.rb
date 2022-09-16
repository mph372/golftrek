class GolfClub < ApplicationRecord
    before_validation :smart_add_url_protocol
    has_many :golf_courses
    belongs_to :line_item, optional: true
    geocoded_by :full_address
    after_validation :geocode
    has_many_attached :images


    def full_address
      [address, city, state, country].compact.join(', ')
    end

    def course_average_price
      average_price = []
      golf_courses.each do |course|
        average = (course.weekday_price + course.twilight_price + course.weekend_price) / 3
        average_price.push(average)
      end
      average_course_price = average_price.sum / average_price.size
      return average_course_price
    end

    def price_range
      if course_average_price > 0
          if course_average_price > 0 && course_average_price <= 50
              return "$"
          elsif course_average_price > 50 && course_average_price <= 100
              return "$$"
          elsif course_average_price > 100 && course_average_price <= 200
              return "$$$"
          elsif course_average_price > 200 && course_average_price <= 350
              return "$$$$"
          elsif course_average_price > 350 
              return "$$$$$"
          end
      else
        return "N/A"
      end
    end



    def find_google_spot
      if google_places_spot.nil?
        @client = GooglePlaces::Client.new(ENV['google_maps_api'])
        @spot = @client.spots_by_query("#{club_name} golf club #{city} #{state}", detail: true).first
        update(google_places_spot: @spot.place_id)
        update(permanently_closed: @spot.permanently_closed)
        update(google_rating: @spot.rating)
      end
    end

    def update_google_attributes
      @client = GooglePlaces::Client.new(ENV['google_maps_api'])
      @spot = @client.spot(google_places_spot)
      update(permanently_closed: @spot.permanently_closed)
      update(google_rating: @spot.rating)
    end

    def download_google_images
      @client = GooglePlaces::Client.new(ENV['google_maps_api'])
      @spot = @client.spot(google_places_spot)

      @spot.photos.each_with_index do |photo, index|
        downloaded_image = URI.open(photo.fetch_url(800))
        self.images.attach(io: downloaded_image, filename: "#{club_name}_#{index}")
      end
    end

    def extract_images
      html = URI.open(website).read
      URI.extract(html).select{ |l| l[/\.(?:gif|png|jpe?g)\b/]}.each_with_index do |image, index|
        self.images.attach(io: image, filename: "#{club_name}_#{index}")
      end
    end

    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
      when ".xls" then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end

    def self.import(file)
      spreadsheet = open_spreadsheet(file) # open spreadsheet
      header = spreadsheet.row(1) # get header row
      (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          t = GolfClub.new
          t.club_id = row["club_id"]
          t.club_name = row["club_name"]
          t.club_membership = row["club_membership"]
          t.number_of_holes = row["number_of_holes"]
          t.address = row["address"]
          t.city = row["city"]
          t.state = row["state"]
          t.country = row["country"]
          t.postal_code = row["postal_code"]
          t.phone = row["phone"]
          t.website = row["website"]
          t.contact_name = row["contact_name"]
          t.contact_title = row["contact_title"]
          t.email_address = row["email_address"]

          if row["driving_range"] == "Yes"
          t.driving_range = true
          else
          t.driving_range = false
          end

          if row["putting_green"] == "Yes"
          t.putting_green = true
          else 
          t.putting_green = false  
          end

          if row["chipping_green"] == "Yes"
          t.chipping_green = true
          else
          t.chipping_green = false  
          end

          if row["practice_bunker"] == "Yes"
          t.practice_bunker = true
          else
          t.practice_bunker = false
          end

          if row["motor_cart"] == "Yes"
          t.motor_cart = true
          else
          t.motor_cart = false
          end
          
          if row["pull_cart"] == "Yes"
          t.pull_cart = true
          else
          t.pull_cart = false
          end

          if row["golf_clubs_rental"] == "Yes"
          t.golf_clubs_rental = true
          else
          t.golf_clubs_rental = false
          end

          if row["club_fitting"] == "Yes"
          t.club_fitting = true
          else
          t.club_fitting = false
          end

          if row["pro_shop"] == "Yes"
          t.pro_shop = true
          else
          t.pro_shop = false
          end

          if row["golf_lessons"] == "Yes"
          t.golf_lessons = true
          else
          t.golf_lessons = false
          end

          if row["caddie_hire"] == "Yes"
          t.caddie_hire = true
          else
          t.caddie_hire = false
          end

          if row["restaurant"] == "Yes"
          t.restaurant = true
          else
            t.restaurant = false
          end

          if row["reception_hall"] == "Yes"
          t.reception_hall = true
          else
          t.reception_hall = false
          end

          if row["changing_room"] == "Yes"
          t.changing_room = true
          else
          t.changing_room = false
          end

          if row["lockers"] == "Yes"
          t.lockers = true
          else
          t.lockers = false 
          end

          if row["lodging_on_site"] == "Yes"
          t.lodging_on_site = true
          else
          t.lodging_on_site = false  
          end

          t.save 
      end
  end



  def smart_add_url_protocol
    unless website[/\Ahttp:\/\//] || website[/\Ahttps:\/\//]
      self.website = "http://#{website}"
    end
  end
=begin
  def booleans
    if row["driving_range"] == "Yes"
      t.driving_range = true
      end
      if row["putting_green"] == "Yes"
      t.putting_green = true
      end
      if row["chipping_green"] == "Yes"
      t.chipping_green = true
      end
      if row["practice_bunker"] == "Yes"
      t.practice_bunker = true
      end
      if row["motor_cart"] == "Yes"
      t.motor_cart = true
      end
      if row["pull_cart"] == "Yes"
      t.pull_cart = true
      end
      if row["golf_clubs_rental"] == "Yes"
      t.golf_clubs_rental = true
      end
      if row["club_fitting"] == "Yes"
      t.club_fitting = true
      end
      if row["pro_shop"] == "Yes"
      t.pro_shop = true
      end
      if row["golf_lessons"] == "Yes"
      t.golf_lessons = true
      end
      if row["caddie_hire"] == "Yes"
      t.caddie_hire = true
      end
      if row["restaurant"] == "Yes"
      t.restaurant = true
      end
      if row["reception_hall"] == "Yes"
      t.reception_hall = true
      end
      if row["changing_room"] == "Yes"
      t.changing_room = true
      end
      if row["lockers"] == "Yes"
      t.lockers = true
      end
      if row["lodging_on_site"] == "Yes"
      t.lodging_on_site = true
      end
  end
=end

def get_weather
  url = URI("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{city}?unitGroup=metric&include=current&key=22M3DNK6XR6HVWZVFRHXADCWQ&contentType=json")

  
 

end

    protected
    
   
end
