class GolfCoursesController < InheritedResources::Base

  def index
    @search = GolfCourse.ransack(params[:q])
    @golf_courses = @search.result(distinct: true)
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
