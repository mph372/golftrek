require "test_helper"

class GolfClubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @golf_club = golf_clubs(:one)
  end

  test "should get index" do
    get golf_clubs_url
    assert_response :success
  end

  test "should get new" do
    get new_golf_club_url
    assert_response :success
  end

  test "should create golf_club" do
    assert_difference("GolfClub.count") do
      post golf_clubs_url, params: { golf_club: { address: @golf_club.address, caddie_hire: @golf_club.caddie_hire, changing_room: @golf_club.changing_room, chipping_green: @golf_club.chipping_green, city: @golf_club.city, club_fitting: @golf_club.club_fitting, club_id: @golf_club.club_id, club_membership: @golf_club.club_membership, club_name: @golf_club.club_name, contact_name: @golf_club.contact_name, contact_title: @golf_club.contact_title, country: @golf_club.country, driving_range: @golf_club.driving_range, email_address: @golf_club.email_address, golf_clubs_rental: @golf_club.golf_clubs_rental, golf_lessons: @golf_club.golf_lessons, last_update: @golf_club.last_update, lockers: @golf_club.lockers, lodging_on_site: @golf_club.lodging_on_site, motor_cart: @golf_club.motor_cart, number_of_holes: @golf_club.number_of_holes, phone: @golf_club.phone, postal_code: @golf_club.postal_code, practice_bunker: @golf_club.practice_bunker, pro_shop: @golf_club.pro_shop, pull_cart: @golf_club.pull_cart, putting_green: @golf_club.putting_green, reception_hall: @golf_club.reception_hall, restaurant: @golf_club.restaurant, state: @golf_club.state, website: @golf_club.website } }
    end

    assert_redirected_to golf_club_url(GolfClub.last)
  end

  test "should show golf_club" do
    get golf_club_url(@golf_club)
    assert_response :success
  end

  test "should get edit" do
    get edit_golf_club_url(@golf_club)
    assert_response :success
  end

  test "should update golf_club" do
    patch golf_club_url(@golf_club), params: { golf_club: { address: @golf_club.address, caddie_hire: @golf_club.caddie_hire, changing_room: @golf_club.changing_room, chipping_green: @golf_club.chipping_green, city: @golf_club.city, club_fitting: @golf_club.club_fitting, club_id: @golf_club.club_id, club_membership: @golf_club.club_membership, club_name: @golf_club.club_name, contact_name: @golf_club.contact_name, contact_title: @golf_club.contact_title, country: @golf_club.country, driving_range: @golf_club.driving_range, email_address: @golf_club.email_address, golf_clubs_rental: @golf_club.golf_clubs_rental, golf_lessons: @golf_club.golf_lessons, last_update: @golf_club.last_update, lockers: @golf_club.lockers, lodging_on_site: @golf_club.lodging_on_site, motor_cart: @golf_club.motor_cart, number_of_holes: @golf_club.number_of_holes, phone: @golf_club.phone, postal_code: @golf_club.postal_code, practice_bunker: @golf_club.practice_bunker, pro_shop: @golf_club.pro_shop, pull_cart: @golf_club.pull_cart, putting_green: @golf_club.putting_green, reception_hall: @golf_club.reception_hall, restaurant: @golf_club.restaurant, state: @golf_club.state, website: @golf_club.website } }
    assert_redirected_to golf_club_url(@golf_club)
  end

  test "should destroy golf_club" do
    assert_difference("GolfClub.count", -1) do
      delete golf_club_url(@golf_club)
    end

    assert_redirected_to golf_clubs_url
  end
end
