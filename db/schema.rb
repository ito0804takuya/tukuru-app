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

ActiveRecord::Schema.define(version: 2019_11_22_061359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["name"], name: "index_companies_on_name"
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_images_on_job_id"
  end

  create_table "job_seekers", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "seeker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_seekers_on_job_id"
    t.index ["seeker_id"], name: "index_job_seekers_on_seeker_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name", null: false
    t.string "body", null: false
    t.string "tel", null: false
    t.string "email", null: false
    t.string "url"
    t.string "postal_code"
    t.string "city", null: false
    t.string "block", null: false
    t.string "bulding", null: false
    t.integer "prefecture_id", null: false
    t.bigint "company_id", null: false
    t.bigint "seeker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["seeker_id"], name: "index_jobs_on_seeker_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seekers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_seekers_on_email", unique: true
    t.index ["name"], name: "index_seekers_on_name"
    t.index ["reset_password_token"], name: "index_seekers_on_reset_password_token", unique: true
  end

  add_foreign_key "images", "jobs"
  add_foreign_key "job_seekers", "jobs"
  add_foreign_key "job_seekers", "seekers"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "seekers"
end
