class LineItemsController < ApplicationController
  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.new(line_item_params)
    
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

  private

  def line_item_params
    params.require(:line_item).permit(:golf_club_id, :itinerary_id, :golf_club, :itinerary)
  end
end
