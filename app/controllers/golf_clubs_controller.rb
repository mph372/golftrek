class GolfClubsController < InheritedResources::Base

  def index
    @search = GolfClub.ransack(params[:q])
    @golf_clubs = @search.result(distinct: true)
  end

  def import
    GolfClub.import(params[:file])
    redirect_to root_url, notice: "Golf Clubs imported."
  end

  def add_to_itinerary(golf_club, itinerary)
    item = LineItem.create!
    item.update(golf_club_id: golf_club.id)
    item.update(itinerary_id: itinerary.id)
  end

  def show
    @golf_club = GolfClub.find(params[:id])
    @line_item = LineItem.new
    @client = GooglePlaces::Client.new(ENV['google_maps_api'])
    if @golf_club.google_places_spot.nil?
    @golf_club.find_google_spot
    end
  end


  private

    def golf_club_params
      params.require(:golf_club).permit(:club_id, :club_name, :club_membership, :number_of_holes, :address, :city, :state, :country, :postal_code, :phone, :website, :contact_name, :contact_title, :email_address, :driving_range, :putting_green, :chipping_green, :practice_bunker, :motor_cart, :pull_cart, :golf_clubs_rental, :club_fitting, :pro_shop, :golf_lessons, :caddie_hire, :restaurant, :reception_hall, :changing_room, :lockers, :lodging_on_site, :last_update, :itinerary_id)
    end

end
