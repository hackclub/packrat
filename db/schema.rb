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

ActiveRecord::Schema.define(version: 20150922105043) do

  create_table "club_members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "full_name"
    t.integer  "club_id"
  end

  add_index "club_members", ["club_id"], name: "index_club_members_on_club_id"
  add_index "club_members", ["email"], name: "index_club_members_on_email", unique: true
  add_index "club_members", ["reset_password_token"], name: "index_club_members_on_reset_password_token", unique: true

  create_table "clubs", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_responses", force: :cascade do |t|
    t.string   "club"
    t.string   "name"
    t.text     "feedback"
    t.string   "phone_number"
    t.string   "rating"
    t.string   "email"
    t.text     "misc"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
