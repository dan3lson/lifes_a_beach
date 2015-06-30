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

ActiveRecord::Schema.define(version: 20150630181120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "beach_amenities", force: :cascade do |t|
    t.integer  "beach_id",   null: false
    t.integer  "amenity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beaches", force: :cascade do |t|
    t.string   "street1",                              null: false
    t.string   "street2"
    t.string   "city",                                 null: false
    t.string   "state",                                null: false
    t.string   "zip",                                  null: false
    t.string   "name",                                 null: false
    t.decimal  "entrance_fee", precision: 8, scale: 2
    t.string   "picture_url"
    t.text     "description"
    t.integer  "user_id",                              null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "beaches", ["city"], name: "index_beaches_on_city", using: :btree
  add_index "beaches", ["name"], name: "index_beaches_on_name", unique: true, using: :btree
  add_index "beaches", ["state"], name: "index_beaches_on_state", using: :btree
  add_index "beaches", ["user_id"], name: "index_beaches_on_user_id", using: :btree
  add_index "beaches", ["zip"], name: "index_beaches_on_zip", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer "rating",                  null: false
    t.text    "description"
    t.integer "beach_id",                null: false
    t.integer "user_id",                 null: false
    t.integer "score",       default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "role",                   default: "user"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer "user_id",               null: false
    t.integer "review_id",             null: false
    t.integer "value",     default: 0
  end

end
