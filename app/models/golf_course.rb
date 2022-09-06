class GolfCourse < ApplicationRecord
    belongs_to :golf_club, optional: true

    def associate_golf_clubs
        if GolfClub.where(:club_id => club_id).exists?
            c = GolfClub.where(:club_id => club_id).last
            update(golf_club_id: c.id)
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
            t.course_id = row["Course ID"]
            t.club_id = row["Facility ID"]
            t.course_name = row["Course Name"]
            t.holes = row["Holes"]
            t.par = row["Par"]
            t.course_type = row["Course Type"]
            t.course_architect = row["Course Architect"]
            t.open_date = row["Open Date"]
            t.guest_policy = row["Guest Policy"]
            t.currency = row["Currency"]
            t.weekday_price = row["Weekday Price"]
            t.weekend_price = row["Weekend Price"]
            t.twilight_price = row["Twilight Price"]
            t.fairway = row["Fairway"]
            t.green = row["Green"]
            t.save
        end
    end

    def has_prices
        if weekday_price > 0 || weekend_price > 0 || twilight_price > 0 
            true
        end
    end

end
