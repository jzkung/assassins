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

ActiveRecord::Schema.define(version: 20140609023605) do

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "num_alive"
    t.boolean  "is_started"
    t.boolean  "has_ended"
    t.float    "term_hrs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kills", force: true do |t|
    t.integer  "game_id"
    t.integer  "target_id"
    t.integer  "assassin_id"
    t.string   "code"
    t.string   "lat"
    t.string   "lng"
    t.datetime "deadline"
    t.datetime "time_killed"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.string   "content"
    t.boolean  "deleted"
    t.datetime "post_date"
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
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_url"
    t.string   "profile_url"
    t.float    "killring_degrees"
    t.datetime "term_date"
    t.string   "role"
    t.string   "status"
    t.string   "kill_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
