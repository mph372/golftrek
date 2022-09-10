class GolfCourse < ApplicationRecord
    belongs_to :golf_club, optional: true
    belongs_to :line_item, optional: true

    def associate_golf_clubs
        if GolfClub.where(:club_id => club_id).exists?
            c = GolfClub.where(:club_id => club_id).last
            update(golf_club_id: c.id)
        end
    end

    def price_range
        if has_prices == true
            average = (weekday_price + twilight_price + weekend_price) / 3
            if average <= 50
                return "$"
            elsif average > 50 && average <= 100
                return "$$"
            elsif average > 100 && average <= 200
                return "$$$"
            elsif average > 200 && average <= 350
                return "$$$$"
            elsif average > 350 
                return "$$$$$"
            end
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
            t = GolfCourse.new
            t.course_id = row["course_id"]
            t.club_id = row["club_id"]
            t.course_name = row["course_name"]
            t.holes = row["holes"]
            t.par = row["par"]
            t.course_type = row["course_type"]
            t.course_architect = row["course_architect"]
            t.open_date = row["open_date"]
            t.guest_policy = row["guest_policy"]
            t.currency = row["currency"]
            t.weekday_price = row["weekday_price"]
            t.weekend_price = row["weekend_price"]
            t.twilight_price = row["twilight_price"]
            t.fairway = row["fairway"]
            t.green = row["green"]
            t.save
            t.associate_golf_clubs
        end
    end

    def has_prices
        if weekday_price > 0 || weekend_price > 0 || twilight_price > 0 
            true
        end
    end

end
