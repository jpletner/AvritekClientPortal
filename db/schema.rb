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

ActiveRecord::Schema.define(version: 20160118184933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.integer  "service_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "service_type"
    t.string   "onsite_contact_name"
    t.string   "onsite_contact_phone"
    t.string   "company_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.text     "equipment_description"
    t.string   "floor"
    t.string   "room"
    t.text     "parking_instructions"
    t.string   "day_option1"
    t.string   "day_option2"
    t.string   "time_option1"
    t.string   "time_option2"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.string   "pallets"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "inventory_file_name"
    t.string   "inventory_content_type"
    t.integer  "inventory_file_size"
    t.datetime "inventory_updated_at"
    t.string   "other_file1_file_name"
    t.string   "other_file1_content_type"
    t.integer  "other_file1_file_size"
    t.datetime "other_file1_updated_at"
  end

  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_city"
    t.string   "company_state"
    t.string   "company_zip"
    t.string   "company_phone"
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "onsite_contact_name"
    t.string   "onsite_contact_phone"
    t.string   "parking_instructions"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "services", "users"
end
