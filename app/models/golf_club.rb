class GolfClub < ApplicationRecord
    before_validation :smart_add_url_protocol

    protected
    
    def smart_add_url_protocol
      unless website[/\Ahttp:\/\//] || website[/\Ahttps:\/\//]
        self.website = "http://#{url}"
      end
    end
end
