require "application_system_test_case"

class GolfClubsTest < ApplicationSystemTestCase
  setup do
    @golf_club = golf_clubs(:one)
  end

  test "visiting the index" do
    visit golf_clubs_url
    assert_selector "h1", text: "Golf clubs"
  end

  test "should create golf club" do
    visit golf_clubs_url
    click_on "New golf club"

    fill_in "Address", with: @golf_club.address
    check "Caddie hire" if @golf_club.caddie_hire
    check "Changing room" if @golf_club.changing_room
    check "Chipping green" if @golf_club.chipping_green
    fill_in "City", with: @golf_club.city
    check "Club fitting" if @golf_club.club_fitting
    fill_in "Club", with: @golf_club.club_id
    fill_in "Club membership", with: @golf_club.club_membership
    fill_in "Club name", with: @golf_club.club_name
    fill_in "Contact name", with: @golf_club.contact_name
    fill_in "Contact title", with: @golf_club.contact_title
    fill_in "Country", with: @golf_club.country
    check "Driving range" if @golf_club.driving_range
    fill_in "Email address", with: @golf_club.email_address
    check "Golf clubs rental" if @golf_club.golf_clubs_rental
    check "Golf lessons" if @golf_club.golf_lessons
    fill_in "Last update", with: @golf_club.last_update
    check "Lockers" if @golf_club.lockers
    check "Lodging on site" if @golf_club.lodging_on_site
    check "Motor cart" if @golf_club.motor_cart
    fill_in "Number of holes", with: @golf_club.number_of_holes
    fill_in "Phone", with: @golf_club.phone
    fill_in "Postal code", with: @golf_club.postal_code
    check "Practice bunker" if @golf_club.practice_bunker
    check "Pro shop" if @golf_club.pro_shop
    check "Pull cart" if @golf_club.pull_cart
    check "Putting green" if @golf_club.putting_green
    check "Reception hall" if @golf_club.reception_hall
    check "Restaurant" if @golf_club.restaurant
    fill_in "State", with: @golf_club.state
    fill_in "Website", with: @golf_club.website
    click_on "Create Golf club"

    assert_text "Golf club was successfully created"
    click_on "Back"
  end

  test "should update Golf club" do
    visit golf_club_url(@golf_club)
    click_on "Edit this golf club", match: :first

    fill_in "Address", with: @golf_club.address
    check "Caddie hire" if @golf_club.caddie_hire
    check "Changing room" if @golf_club.changing_room
    check "Chipping green" if @golf_club.chipping_green
    fill_in "City", with: @golf_club.city
    check "Club fitting" if @golf_club.club_fitting
    fill_in "Club", with: @golf_club.club_id
    fill_in "Club membership", with: @golf_club.club_membership
    fill_in "Club name", with: @golf_club.club_name
    fill_in "Contact name", with: @golf_club.contact_name
    fill_in "Contact title", with: @golf_club.contact_title
    fill_in "Country", with: @golf_club.country
    check "Driving range" if @golf_club.driving_range
    fill_in "Email address", with: @golf_club.email_address
    check "Golf clubs rental" if @golf_club.golf_clubs_rental
    check "Golf lessons" if @golf_club.golf_lessons
    fill_in "Last update", with: @golf_club.last_update
    check "Lockers" if @golf_club.lockers
    check "Lodging on site" if @golf_club.lodging_on_site
    check "Motor cart" if @golf_club.motor_cart
    fill_in "Number of holes", with: @golf_club.number_of_holes
    fill_in "Phone", with: @golf_club.phone
    fill_in "Postal code", with: @golf_club.postal_code
    check "Practice bunker" if @golf_club.practice_bunker
    check "Pro shop" if @golf_club.pro_shop
    check "Pull cart" if @golf_club.pull_cart
    check "Putting green" if @golf_club.putting_green
    check "Reception hall" if @golf_club.reception_hall
    check "Restaurant" if @golf_club.restaurant
    fill_in "State", with: @golf_club.state
    fill_in "Website", with: @golf_club.website
    click_on "Update Golf club"

    assert_text "Golf club was successfully updated"
    click_on "Back"
  end

  test "should destroy Golf club" do
    visit golf_club_url(@golf_club)
    click_on "Destroy this golf club", match: :first

    assert_text "Golf club was successfully destroyed"
  end
end
