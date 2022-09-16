class ItinerariesController < InheritedResources::Base


  def show
    @line_item = LineItem.new
    @itinerary = Itinerary.find(params[:id])
  end
  private

  

    def itinerary_params
      params.require(:itinerary).permit(:title, :start_date, :end_date, :user_id, :public_itinerary)
    end

end
