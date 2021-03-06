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

ActiveRecord::Schema.define(version: 20140618215652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "polls", force: true do |t|
    t.integer  "user_id"
    t.integer  "tiebreaker"
    t.string   "tier1team1"
    t.string   "tier1team2"
    t.string   "tier2team1"
    t.string   "tier2team2"
    t.string   "tier3team1"
    t.string   "tier3team2"
    t.string   "tier4team1"
    t.string   "tier4team2"
    t.string   "player1"
    t.string   "player2"
    t.string   "name"
    t.integer  "player1_score",      default: 0
    t.integer  "player2_score",      default: 0
    t.integer  "group_score",        default: 0
    t.integer  "advance_from_group", default: 0
    t.integer  "quarterfinal_score", default: 0
    t.integer  "semifinal_score",    default: 0
    t.integer  "championship_score", default: 0
    t.integer  "score",              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "round_of_sixteen",   default: 0
    t.boolean  "paid",               default: true
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "role"
    t.string   "uid"
    t.string   "refresh_token"
    t.string   "access_token"
    t.string   "expires"
    t.string   "login_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password"
    t.string   "salt"
  end

end
