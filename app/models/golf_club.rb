class GolfClub < ApplicationRecord
    before_validation :smart_add_url_protocol
    has_many :golf_courses
    belongs_to :itinerary, optional: true
    belongs_to :line_item

    def full_address
      "#{address}, #{city}, #{state}, #{country}"
    end

    def self.import(file)
      spreadsheet = open_spreadsheet(file) # open spreadsheet
      header = spreadsheet.row(1) # get header row
      (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          t = GolfClub.new
          t.club_id = row["Facility ID"]
          t.club_name = row["Club Name"]
          t.club_membership = row["Club Membership"]
          t.number_of_holes = row["Number of Holes"]
          t.address = row["Address"]
          t.city = row["City"]
          t.state = row["State"]
          t.country = row["Country"]
          t.postal_code = row["Postal Code"]
          t.phone = row["Phone"]
          t.website = row["Website"]
          t.contact_name = row["Contact Name"]
          t.contact_title = row["Contact Title"]
          t.email_address = row["Email Address"]
          if row["Driving Range"] == "Yes"
          t.driving_range = true
          end
          if row["Putting Green"] == "Yes"
          t.putting_green = true
          end
          if row["Chipping Green"] == "Yes"
          t.chipping_green = true
          end
          if row["Practice Bunker"] == "Yes"
          t.practice_bunker = true
          end
          if row["Motor Cart"] == "Yes"
          t.motor_cart = true
          end
          if row["Pull Cart"] == "Yes"
          t.pull_cart = true
          end
          if row["Golf Clubs Rental"] == "Yes"
          t.golf_clubs_rental = true
          end
          if row["Club Fitting"] == "Yes"
          t.club_fitting = true
          end
          if row["Pro Shop"] == "Yes"
          t.pro_shop = true
          end
          if row["Golf Lessons"] == "Yes"
          t.golf_lessons = true
          end
          if row["Caddie Hire"] == "Yes"
          t.caddie_hire = true
          end
          if row["Restaurant"] == "Yes"
          t.restaurant = true
          end
          if row["Reception Hall"] == "Yes"
          t.reception_hall = true
          end
          if row["Changning Room"] == "Yes"
          t.changing_room = true
          end
          if row["Lockers"] == "Yes"
          t.lockers = true
          end
          if row["Lodging on Site"] == "Yes"
          t.lodging_on_site = true
          end
          t.save
        
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

  def smart_add_url_protocol
    unless website[/\Ahttp:\/\//] || website[/\Ahttps:\/\//]
      self.website = "http://#{website}"
    end
  end

    protected
    
   
end
