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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121221025658) do

  create_table "managers", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prizes", :force => true do |t|
    t.integer  "amount"
    t.integer  "tournament_id"
    t.date     "date"
    t.integer  "place"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
    t.integer  "swap_id"
    t.integer  "receiver_prize_id"
    t.integer  "package_id"
  end

  create_table "recuests", :force => true do |t|
    t.integer  "percent"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.integer  "amount"
    t.string   "type"
    t.string   "description"
    t.datetime "time_frame"
    t.boolean  "active"
    t.integer  "tournament_id"
    t.decimal  "markup"
  end

  create_table "tournament_packages", :force => true do |t|
    t.integer "tournament_id"
    t.integer "package_id"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.integer  "buy_in"
    t.integer  "place"
    t.integer  "prize"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "entries"
    t.integer  "user_id"
    t.datetime "date"
  end

  create_table "user_tournaments", :force => true do |t|
    t.integer "user_id"
    t.integer "tournament_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.string   "name"
    t.string   "#<ActiveRecord::ConnectionAdapters::TableDefinition:0x007fc01672ee20>"
    t.string   "password_digest"
    t.string   "email"
    t.integer  "inbound_requests"
  end

end
