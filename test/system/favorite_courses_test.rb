require "application_system_test_case"

class FavoriteCoursesTest < ApplicationSystemTestCase
  setup do
    @favorite_course = favorite_courses(:one)
  end

  test "visiting the index" do
    visit favorite_courses_url
    assert_selector "h1", text: "Favorite courses"
  end

  test "should create favorite course" do
    visit favorite_courses_url
    click_on "New favorite course"

    fill_in "User", with: @favorite_course.user_id
    click_on "Create Favorite course"

    assert_text "Favorite course was successfully created"
    click_on "Back"
  end

  test "should update Favorite course" do
    visit favorite_course_url(@favorite_course)
    click_on "Edit this favorite course", match: :first

    fill_in "User", with: @favorite_course.user_id
    click_on "Update Favorite course"

    assert_text "Favorite course was successfully updated"
    click_on "Back"
  end

  test "should destroy Favorite course" do
    visit favorite_course_url(@favorite_course)
    click_on "Destroy this favorite course", match: :first

    assert_text "Favorite course was successfully destroyed"
  end
end
