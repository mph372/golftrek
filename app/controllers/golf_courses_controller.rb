class GolfCoursesController < InheritedResources::Base

  def import
    GolfCourse.import(params[:file])
    redirect_to root_url, notice: "Golf Courses imported."
  end

  private

    def golf_course_params
      params.require(:golf_course).permit(:course_id, :club_id, :course_name, :holes, :par, :course_type, :course_architect, :open_date, :guest_policy, :currency, :weekday_price, :weekend_price, :twilight_price, :fairway, :green, :last_update)
    end

end
