require "application_system_test_case"

class GolfCoursesTest < ApplicationSystemTestCase
  setup do
    @golf_course = golf_courses(:one)
  end

  test "visiting the index" do
    visit golf_courses_url
    assert_selector "h1", text: "Golf courses"
  end

  test "should create golf course" do
    visit golf_courses_url
    click_on "New golf course"

    fill_in "Club", with: @golf_course.club_id
    fill_in "Course architect", with: @golf_course.course_architect
    fill_in "Course", with: @golf_course.course_id
    fill_in "Course name", with: @golf_course.course_name
    fill_in "Course type", with: @golf_course.course_type
    fill_in "Currency", with: @golf_course.currency
    fill_in "Fairway", with: @golf_course.fairway
    fill_in "Green", with: @golf_course.green
    fill_in "Guest policy", with: @golf_course.guest_policy
    fill_in "Holes", with: @golf_course.holes
    fill_in "Last update", with: @golf_course.last_update
    fill_in "Open date", with: @golf_course.open_date
    fill_in "Par", with: @golf_course.par
    fill_in "Twilight price", with: @golf_course.twilight_price
    fill_in "Weekday price", with: @golf_course.weekday_price
    fill_in "Weekend price", with: @golf_course.weekend_price
    click_on "Create Golf course"

    assert_text "Golf course was successfully created"
    click_on "Back"
  end

  test "should update Golf course" do
    visit golf_course_url(@golf_course)
    click_on "Edit this golf course", match: :first

    fill_in "Club", with: @golf_course.club_id
    fill_in "Course architect", with: @golf_course.course_architect
    fill_in "Course", with: @golf_course.course_id
    fill_in "Course name", with: @golf_course.course_name
    fill_in "Course type", with: @golf_course.course_type
    fill_in "Currency", with: @golf_course.currency
    fill_in "Fairway", with: @golf_course.fairway
    fill_in "Green", with: @golf_course.green
    fill_in "Guest policy", with: @golf_course.guest_policy
    fill_in "Holes", with: @golf_course.holes
    fill_in "Last update", with: @golf_course.last_update
    fill_in "Open date", with: @golf_course.open_date
    fill_in "Par", with: @golf_course.par
    fill_in "Twilight price", with: @golf_course.twilight_price
    fill_in "Weekday price", with: @golf_course.weekday_price
    fill_in "Weekend price", with: @golf_course.weekend_price
    click_on "Update Golf course"

    assert_text "Golf course was successfully updated"
    click_on "Back"
  end

  test "should destroy Golf course" do
    visit golf_course_url(@golf_course)
    click_on "Destroy this golf course", match: :first

    assert_text "Golf course was successfully destroyed"
  end
end
