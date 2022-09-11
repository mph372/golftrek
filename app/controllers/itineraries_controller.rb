class ItinerariesController < InheritedResources::Base

  private

  

    def itinerary_params
      params.require(:itinerary).permit(:title, :start_date, :end_date, :user_id, :public_itinerary)
    end

end
