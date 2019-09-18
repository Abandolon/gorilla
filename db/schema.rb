# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_14_092943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "gym_id"
    t.datetime "date"
    t.bigint "starter_id"
    t.bigint "veteran_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gift_id"
    t.string "status"
    t.bigint "chat_room_id"
    t.index ["chat_room_id"], name: "index_bookings_on_chat_room_id"
    t.index ["gift_id"], name: "index_bookings_on_gift_id"
    t.index ["gym_id"], name: "index_bookings_on_gym_id"
    t.index ["starter_id"], name: "index_bookings_on_starter_id"
    t.index ["veteran_id"], name: "index_bookings_on_veteran_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "chat_room_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "user_gifts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "gift_id"
    t.index ["gift_id"], name: "index_user_gifts_on_gift_id"
    t.index ["user_id"], name: "index_user_gifts_on_user_id"
  end

  create_table "user_styles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["style_id"], name: "index_user_styles_on_style_id"
    t.index ["user_id"], name: "index_user_styles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "gender"
    t.integer "age"
    t.text "description"
    t.string "photo"
    t.boolean "veteran", default: false
    t.bigint "gym_id"
    t.boolean "pirate"
    t.boolean "beach"
    t.boolean "summer"
    t.boolean "book"
    t.boolean "vegetable"
    t.boolean "bicycle"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gym_id"], name: "index_users_on_gym_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "chat_rooms"
  add_foreign_key "bookings", "gifts"
  add_foreign_key "bookings", "gyms"
  add_foreign_key "bookings", "users", column: "starter_id"
  add_foreign_key "bookings", "users", column: "veteran_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "user_gifts", "gifts"
  add_foreign_key "user_gifts", "users"
  add_foreign_key "user_styles", "styles"
  add_foreign_key "user_styles", "users"
  add_foreign_key "users", "gyms"
end
