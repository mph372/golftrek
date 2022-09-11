class LineItemsController < ApplicationController
  def new
    @line_item = LineItem.new
  end

  def create
    golf_course = GolfCourse.find(params[:golf_course_id])
    itinerary = current_user.itineraries.last

    @line_item = LineItem.new
    @line_item.golf_course_id = golf_course.id
    @line_item.itinerary_id = itinerary.id
    @line_item.set_date
    
    @line_item.save
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.itinerary, notice: 'Golf Club was successfully added.' }
        format.json { render :show, status: :created, location: @line_item.itinerary }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def destroy
    
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_back(fallback_location: root_path)
  end  

  def show
  end

  private

  def line_item_params
    params.require(:line_item).permit(:golf_club_id, :itinerary_id, :golf_club, :itinerary, :golf_course_id)
  end
end
