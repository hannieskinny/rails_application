# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130912164527) do

  create_table "assets", force: true do |t|
    t.string   "asset"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: true do |t|
    t.string   "brand"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "user_id"
  end

  add_index "cars", ["state_id"], name: "index_cars_on_state_id"
  add_index "cars", ["user_id"], name: "index_cars_on_user_id"

  create_table "cars_tags", id: false, force: true do |t|
    t.integer "tag_id"
    t.integer "car_id"
  end

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "previous_state_id"
  end

  create_table "states", force: true do |t|
    t.string "name"
    t.string "color"
    t.string "background"
  end

  create_table "table_cars_tags", force: true do |t|
    t.string "name"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "tags_cars", id: false, force: true do |t|
    t.integer "tag_id"
    t.integer "car_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
