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

ActiveRecord::Schema.define(version: 20141217145300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: true do |t|
    t.string   "name"
    t.integer  "damage"
    t.integer  "priority"
    t.integer  "defense"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points"
  end

  create_table "gladiator_equipments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gladiator_id"
    t.integer  "equipment_id"
  end

  add_index "gladiator_equipments", ["equipment_id"], name: "index_gladiator_equipments_on_equipment_id", using: :btree
  add_index "gladiator_equipments", ["gladiator_id"], name: "index_gladiator_equipments_on_gladiator_id", using: :btree

  create_table "gladiators", force: true do |t|
    t.string   "name"
    t.integer  "victories"
    t.integer  "fights"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "equipment_id"
    t.integer  "points_equipment"
  end

  add_index "gladiators", ["equipment_id"], name: "index_gladiators_on_equipment_id", using: :btree
  add_index "gladiators", ["team_id"], name: "index_gladiators_on_team_id", using: :btree
  add_index "gladiators", ["user_id"], name: "index_gladiators_on_user_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "victories"
    t.integer  "fights"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "tournament_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "tournament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_teams", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "team_id"
  end

  add_index "user_teams", ["team_id"], name: "index_user_teams_on_team_id", using: :btree
  add_index "user_teams", ["user_id"], name: "index_user_teams_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
