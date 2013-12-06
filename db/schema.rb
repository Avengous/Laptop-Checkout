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

ActiveRecord::Schema.define(version: 20131206220620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "laptop_histories", force: true do |t|
    t.integer "laptop_id"
    t.integer "transaction_id"
  end

  create_table "laptops", force: true do |t|
    t.string  "scan_code"
    t.string  "item_name"
    t.boolean "available", default: true
  end

  create_table "transactions", force: true do |t|
    t.integer  "laptops_id"
    t.integer  "users_id"
    t.boolean  "checked_out"
    t.datetime "checked_out_time"
    t.datetime "checked_in_time"
  end

  create_table "user_histories", force: true do |t|
    t.integer "user_id"
    t.integer "transaction_id"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
  end

end
