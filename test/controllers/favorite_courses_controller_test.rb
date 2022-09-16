require "test_helper"

class FavoriteCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_course = favorite_courses(:one)
  end

  test "should get index" do
    get favorite_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_course_url
    assert_response :success
  end

  test "should create favorite_course" do
    assert_difference("FavoriteCourse.count") do
      post favorite_courses_url, params: { favorite_course: { user_id: @favorite_course.user_id } }
    end

    assert_redirected_to favorite_course_url(FavoriteCourse.last)
  end

  test "should show favorite_course" do
    get favorite_course_url(@favorite_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_course_url(@favorite_course)
    assert_response :success
  end

  test "should update favorite_course" do
    patch favorite_course_url(@favorite_course), params: { favorite_course: { user_id: @favorite_course.user_id } }
    assert_redirected_to favorite_course_url(@favorite_course)
  end

  test "should destroy favorite_course" do
    assert_difference("FavoriteCourse.count", -1) do
      delete favorite_course_url(@favorite_course)
    end

    assert_redirected_to favorite_courses_url
  end
end
