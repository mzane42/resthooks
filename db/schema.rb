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

ActiveRecord::Schema.define(version: 20130313034401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deliciousness"
  end

  add_index "beers", ["user_id"], name: "index_beers_on_user_id"

  create_table "burgers", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deliciousness"
  end

  add_index "burgers", ["user_id"], name: "index_burgers_on_user_id"

  create_table "resource_subscriptions", force: true do |t|
    t.integer  "user_id"
    t.string   "post_url"
    t.integer  "version"
    t.string   "subscribed_resource"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_subscriptions", ["user_id"], name: "index_resource_subscriptions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "api_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
