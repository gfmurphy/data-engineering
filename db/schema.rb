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

ActiveRecord::Schema.define(version: 20140412152736) do

  create_table "items", force: true do |t|
    t.string   "description"
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["description", "price"], name: "index_items_on_description_and_price"

  create_table "merchants", force: true do |t|
    t.string   "address"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchants", ["address", "name"], name: "index_merchants_on_address_and_name"

  create_table "purchasers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchasers", ["name"], name: "index_purchasers_on_name"

  create_table "purchases", force: true do |t|
    t.integer  "purchaser_id"
    t.integer  "item_id"
    t.integer  "merchant_id"
    t.integer  "item_count",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["item_id"], name: "index_purchases_on_item_id"
  add_index "purchases", ["merchant_id"], name: "index_purchases_on_merchant_id"
  add_index "purchases", ["purchaser_id"], name: "index_purchases_on_purchaser_id"

end
