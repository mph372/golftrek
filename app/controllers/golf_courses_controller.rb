class GolfCoursesController < InheritedResources::Base

  def index
    @search = GolfCourse.ransack(params[:q])
    if (params[:course_name_cont] != "") then
    @golf_courses = @search.result(distinct: true)
    end
  end

  def add_to_itinerary(golf_course, itinerary)
    item = LineItem.create!
    item.update(golf_course_id: golf_course.id)
    item.update(itinerary_id: itinerary.id)
  end


  def import
    GolfCourse.import(params[:file])
    redirect_to root_url, notice: "Golf Courses imported."
  end

  private

    def golf_course_params
      params.require(:golf_course).permit(:course_id, :club_id, :course_name, :holes, :par, :course_type, :course_architect, :open_date, :guest_policy, :currency, :weekday_price, :weekend_price, :twilight_price, :fairway, :green, :last_update)
    end

end
