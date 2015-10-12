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

ActiveRecord::Schema.define(version: 20151012025556) do

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedback_responses", force: :cascade do |t|
    t.integer  "meeting_id"
    t.integer  "rating"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "one_thing_to_improve_on"
    t.text     "one_thing_done_well"
    t.text     "anything_else_to_share"
    t.string   "project_description"
    t.integer  "member_id"
  end

  add_index "feedback_responses", ["meeting_id"], name: "index_feedback_responses_on_meeting_id"
  add_index "feedback_responses", ["member_id"], name: "index_feedback_responses_on_member_id"

  create_table "leaders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "meetings", ["club_id"], name: "index_meetings_on_club_id"

  create_table "members", force: :cascade do |t|
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["club_id"], name: "index_members_on_club_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "meta_id"
    t.string   "meta_type"
  end

  add_index "users", ["meta_id", "meta_type"], name: "index_users_on_meta_id_and_meta_type"

end
