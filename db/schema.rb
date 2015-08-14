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

ActiveRecord::Schema.define(version: 20150814123632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "restaurant_genre_restaurants", force: :cascade do |t|
    t.integer  "restaurant_id", null: false
    t.integer  "genre_id",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "restaurant_genre_restaurants", ["genre_id"], name: "index_restaurant_genre_restaurants_on_genre_id", using: :btree
  add_index "restaurant_genre_restaurants", ["restaurant_id"], name: "index_restaurant_genre_restaurants_on_restaurant_id", using: :btree

  create_table "restaurant_genres", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "restaurant_genres", ["name"], name: "index_restaurant_genres_on_name", unique: true, using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "tel"
    t.text     "intro"
    t.string   "open"
    t.string   "close"
    t.string   "address"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",         null: false
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "nickname"
    t.date     "birth_date"
    t.integer  "sex",              null: false
    t.string   "grade"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "restaurant_genre_restaurants", "restaurant_genres", column: "genre_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "restaurant_genre_restaurants", "restaurants", on_update: :cascade, on_delete: :cascade
end
