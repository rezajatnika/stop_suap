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

ActiveRecord::Schema.define(version: 20151123121353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.integer  "story_id"
    t.integer  "city_id"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["city_id"], name: "index_locations_on_city_id", using: :btree
  add_index "locations", ["province_id"], name: "index_locations_on_province_id", using: :btree
  add_index "locations", ["story_id"], name: "index_locations_on_story_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.float    "amount"
    t.datetime "event_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "email"
  end

  add_index "stories", ["category_id"], name: "index_stories_on_category_id", using: :btree
  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password",                null: false
    t.string   "password_salt",                   null: false
    t.string   "persistence_token",               null: false
    t.string   "single_access_token",             null: false
    t.string   "perishable_token",                null: false
    t.integer  "login_count",         default: 0, null: false
    t.integer  "failed_login_count",  default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "cities", "provinces", on_delete: :cascade
  add_foreign_key "locations", "stories", on_delete: :cascade
  add_foreign_key "stories", "categories", on_delete: :cascade
  add_foreign_key "stories", "users", on_delete: :cascade
end
