# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_07_202632) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "golf_clubs", force: :cascade do |t|
    t.string "club_id"
    t.string "club_name"
    t.string "club_membership"
    t.integer "number_of_holes"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.string "phone"
    t.string "website"
    t.string "contact_name"
    t.string "contact_title"
    t.string "email_address"
    t.boolean "driving_range"
    t.boolean "putting_green"
    t.boolean "chipping_green"
    t.boolean "practice_bunker"
    t.boolean "motor_cart"
    t.boolean "pull_cart"
    t.boolean "golf_clubs_rental"
    t.boolean "club_fitting"
    t.boolean "pro_shop"
    t.boolean "golf_lessons"
    t.boolean "caddie_hire"
    t.boolean "restaurant"
    t.boolean "reception_hall"
    t.boolean "changing_room"
    t.boolean "lockers"
    t.boolean "lodging_on_site"
    t.date "last_update"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "itinerary_id"
    t.float "latitude"
    t.float "longitude"
    t.string "google_places_spot"
    t.index ["itinerary_id"], name: "index_golf_clubs_on_itinerary_id"
  end

  create_table "golf_courses", force: :cascade do |t|
    t.string "course_id"
    t.string "club_id"
    t.string "course_name"
    t.integer "holes"
    t.integer "par"
    t.string "course_type"
    t.string "course_architect"
    t.string "guest_policy"
    t.string "currency"
    t.integer "weekday_price"
    t.integer "weekend_price"
    t.integer "twilight_price"
    t.string "fairway"
    t.string "green"
    t.date "last_update"
    t.bigint "golf_club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "open_date"
    t.index ["golf_club_id"], name: "index_golf_courses_on_golf_club_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.boolean "public_itinerary"
    t.boolean "influencer_created"
    t.string "influencer_creator"
    t.string "influencer_link"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.date "date"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "golf_club_id", null: false
    t.index ["golf_club_id"], name: "index_line_items_on_golf_club_id"
    t.index ["itinerary_id"], name: "index_line_items_on_itinerary_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "golf_clubs", "itineraries"
  add_foreign_key "itineraries", "users"
  add_foreign_key "line_items", "golf_clubs"
  add_foreign_key "line_items", "itineraries"
end
