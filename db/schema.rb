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

ActiveRecord::Schema.define(version: 20140425101402) do

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "reg_start"
    t.datetime "reg_end"
    t.datetime "game_start"
    t.integer  "num_alive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kills", force: true do |t|
    t.integer  "target_id"
    t.integer  "assassin_id"
    t.string   "code"
    t.string   "location"
    t.datetime "deadline"
    t.datetime "time_killed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "users", force: true do |t|
    t.integer  "game_id"
    t.integer  "target_id"
    t.integer  "assassin_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "login"
    t.string   "phone_number"
    t.string   "password"
    t.string   "role"
    t.string   "status"
    t.string   "kill_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
