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

ActiveRecord::Schema.define(version: 20160323142410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer  "amount"
    t.text     "description"
    t.string   "status",      default: "open"
    t.integer  "job_id"
    t.integer  "drone_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "bids", ["drone_id"], name: "index_bids_on_drone_id", using: :btree
  add_index "bids", ["job_id"], name: "index_bids_on_job_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drones", force: :cascade do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "camera"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
  end

  add_index "drones", ["user_id"], name: "index_drones_on_user_id", using: :btree

  create_table "job_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "job_categories", ["category_id"], name: "index_job_categories_on_category_id", using: :btree
  add_index "job_categories", ["job_id"], name: "index_job_categories_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.text     "description"
    t.string   "location"
    t.date     "date"
    t.string   "status",      default: "open"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "title"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "user_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_categories", ["category_id"], name: "index_user_categories_on_category_id", using: :btree
  add_index "user_categories", ["user_id"], name: "index_user_categories_on_user_id", using: :btree

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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "owner",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_pic"
    t.string   "banner_pic"
    t.text     "description"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bids", "drones"
  add_foreign_key "bids", "jobs"
  add_foreign_key "drones", "users"
  add_foreign_key "job_categories", "categories"
  add_foreign_key "job_categories", "jobs"
  add_foreign_key "jobs", "users"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_categories", "users"
end
