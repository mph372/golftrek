require "test_helper"

class GolfCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @golf_course = golf_courses(:one)
  end

  test "should get index" do
    get golf_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_golf_course_url
    assert_response :success
  end

  test "should create golf_course" do
    assert_difference("GolfCourse.count") do
      post golf_courses_url, params: { golf_course: { club_id: @golf_course.club_id, course_architect: @golf_course.course_architect, course_id: @golf_course.course_id, course_name: @golf_course.course_name, course_type: @golf_course.course_type, currency: @golf_course.currency, fairway: @golf_course.fairway, green: @golf_course.green, guest_policy: @golf_course.guest_policy, holes: @golf_course.holes, last_update: @golf_course.last_update, open_date: @golf_course.open_date, par: @golf_course.par, twilight_price: @golf_course.twilight_price, weekday_price: @golf_course.weekday_price, weekend_price: @golf_course.weekend_price } }
    end

    assert_redirected_to golf_course_url(GolfCourse.last)
  end

  test "should show golf_course" do
    get golf_course_url(@golf_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_golf_course_url(@golf_course)
    assert_response :success
  end

  test "should update golf_course" do
    patch golf_course_url(@golf_course), params: { golf_course: { club_id: @golf_course.club_id, course_architect: @golf_course.course_architect, course_id: @golf_course.course_id, course_name: @golf_course.course_name, course_type: @golf_course.course_type, currency: @golf_course.currency, fairway: @golf_course.fairway, green: @golf_course.green, guest_policy: @golf_course.guest_policy, holes: @golf_course.holes, last_update: @golf_course.last_update, open_date: @golf_course.open_date, par: @golf_course.par, twilight_price: @golf_course.twilight_price, weekday_price: @golf_course.weekday_price, weekend_price: @golf_course.weekend_price } }
    assert_redirected_to golf_course_url(@golf_course)
  end

  test "should destroy golf_course" do
    assert_difference("GolfCourse.count", -1) do
      delete golf_course_url(@golf_course)
    end

    assert_redirected_to golf_courses_url
  end
end
