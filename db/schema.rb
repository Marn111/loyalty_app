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

ActiveRecord::Schema.define(version: 2019_07_12_062046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "purchases", force: :cascade do |t|
    t.integer "user_id"
    t.float "amount"
    t.jsonb "items", default: "{}", null: false
    t.integer "ordered_from"
    t.integer "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "collected_points", default: 0.0
    t.index ["items"], name: "index_purchases_on_items", using: :gin
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "birthday"
    t.float "points", default: 0.0
    t.integer "origin_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "rewards", default: "{}", null: false
    t.index ["rewards"], name: "index_users_on_rewards", using: :gin
  end

end
