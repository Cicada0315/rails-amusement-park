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

ActiveRecord::Schema.define(version: 2021_04_20_210119) do

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.integer "tickets", default: 0
    t.integer "nausea_rating", default: 0
    t.integer "happiness_rating", default: 0
    t.integer "min_height", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_rides_on_attraction_id"
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false
    t.string "password_digest"
    t.integer "nausea", default: 0
    t.integer "happiness", default: 0
    t.integer "tickets", default: 0
    t.integer "height", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
