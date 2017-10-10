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

ActiveRecord::Schema.define(version: 20171009141211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controls", force: :cascade do |t|
    t.string "body"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_controls_on_category_id"
  end

  create_table "flras", force: :cascade do |t|
    t.text "description"
    t.bigint "worker_id"
    t.bigint "supervisor_id"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "worker_risk_score"
    t.integer "super_risk_score"
    t.integer "risk_differential"
    t.bigint "category_id"
    t.text "notes"
    t.integer "follow_up_status"
    t.index ["category_id"], name: "index_flras_on_category_id"
    t.index ["supervisor_id"], name: "index_flras_on_supervisor_id"
    t.index ["worker_id"], name: "index_flras_on_worker_id"
  end

  create_table "logins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "loginable_type"
    t.bigint "loginable_id"
    t.index ["loginable_type", "loginable_id"], name: "index_logins_on_loginable_type_and_loginable_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "site_id"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_managers_on_site_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "flra_id"
    t.bigint "question_id"
    t.index ["flra_id"], name: "index_responses_on_flra_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supervisors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "manager_id"
    t.string "profile_picture"
    t.index ["manager_id"], name: "index_supervisors_on_manager_id"
  end

  create_table "top_risks", force: :cascade do |t|
    t.string "body"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_top_risks_on_category_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "profile_picture"
  end

  add_foreign_key "controls", "categories"
  add_foreign_key "flras", "categories"
  add_foreign_key "flras", "supervisors"
  add_foreign_key "flras", "workers"
  add_foreign_key "managers", "sites"
  add_foreign_key "responses", "flras"
  add_foreign_key "responses", "questions"
  add_foreign_key "supervisors", "managers"
  add_foreign_key "top_risks", "categories"
end
