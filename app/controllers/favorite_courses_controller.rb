class FavoriteCoursesController < InheritedResources::Base
  before_action :check_favorite_courses_presence, only: [:new, :create]

  def index
    
  end

  def show
    @favorite_course = FavoriteCourse.find(params[:id])
    @line_items = @favorite_course.line_items.order(:position).all
  end

  def new
  end
  
  def create
  end

  private

    def favorite_course_params
      params.require(:favorite_course).permit(:user_id)
    end

    def check_favorite_courses_presence
      redirect_to user_profile_path if current_user.favorite_courses.exists?
    end

end
