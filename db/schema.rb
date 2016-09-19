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

ActiveRecord::Schema.define(version: 20140104043322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cfp_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "notified",    default: false
  end

  create_table "cfp_configs", force: :cascade do |t|
    t.string "var"
    t.string "value"
  end

  create_table "cfp_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "title"
    t.string   "company"
    t.text     "bio"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "cfp_proposals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "level"
    t.text     "abstract"
    t.text     "description"
    t.string   "language"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",    default: false
  end

  create_table "cfp_ranks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "roles"
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
