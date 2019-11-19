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

ActiveRecord::Schema.define(version: 20191118202923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "templates", force: :cascade do |t|
    t.text "structure"
    t.text "initial_prayer"
    t.text "motivation"
    t.text "gospel"
    t.text "activities"
    t.text "purpose"
    t.text "final_prayer"
    t.text "annexed"
    t.text "calendar"
    t.integer "initial_year"
    t.integer "initial_month"
    t.integer "initial_day"
    t.integer "final_year"
    t.integer "final_month"
    t.integer "final_day"
    t.string "monday_gospel"
    t.string "monday_saints"
    t.string "tuesday_gospel"
    t.string "tuesday_saints"
    t.string "wednesday_gospel"
    t.string "wednesday_saints"
    t.string "thursday_gospel"
    t.string "thursday_saints"
    t.string "friday_gospel"
    t.string "friday_saints"
    t.string "saturday_gospel"
    t.string "saturday_saints"
    t.string "sunday_gospel"
    t.string "sunday_saints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

end
