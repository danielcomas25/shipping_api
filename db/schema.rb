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

ActiveRecord::Schema.define(version: 20220102194440) do

  create_table "carriers", force: :cascade do |t|
    t.string   "code"
    t.integer  "delivery_promise"
    t.boolean  "saturday_deliveries"
    t.integer  "oversea_delay_threshold"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "country_distances", force: :cascade do |t|
    t.string   "country"
    t.text     "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "package_id"
    t.date     "expected_delivery"
    t.integer  "oversea_delay"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["package_id"], name: "index_deliveries_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.integer  "carrier_id"
    t.date     "shipping_date"
    t.string   "origin_country"
    t.string   "destination_country"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["carrier_id"], name: "index_packages_on_carrier_id"
  end

end
