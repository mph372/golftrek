class GolfClubsController < InheritedResources::Base

  private

    def golf_club_params
      params.require(:golf_club).permit(:club_id, :club_name, :club_membership, :number_of_holes, :address, :city, :state, :country, :postal_code, :phone, :website, :contact_name, :contact_title, :email_address, :driving_range, :putting_green, :chipping_green, :practice_bunker, :motor_cart, :pull_cart, :golf_clubs_rental, :club_fitting, :pro_shop, :golf_lessons, :caddie_hire, :restaurant, :reception_hall, :changing_room, :lockers, :lodging_on_site, :last_update)
    end

end
