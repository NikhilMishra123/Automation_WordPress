# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_15_132831) do

  create_table "results", force: :cascade do |t|
    t.integer "testsuite_id", null: false
    t.integer "site_id", null: false
    t.string "TestResult"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_results_on_site_id"
    t.index ["testsuite_id"], name: "index_results_on_testsuite_id"
  end

  create_table "run_processes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "siteURL", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["siteURL"], name: "index_sites_on_siteURL", unique: true
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "testsuites", force: :cascade do |t|
    t.string "TestName", null: false
    t.string "address"
    t.string "cat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["TestName"], name: "index_testsuites_on_TestName", unique: true
  end

  create_table "user1s", force: :cascade do |t|
    t.string "email", null: false
    t.text "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_user1s_on_email", unique: true
    t.index ["password"], name: "index_user1s_on_password", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.text "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["password"], name: "index_users_on_password", unique: true
  end

  add_foreign_key "results", "sites"
  add_foreign_key "results", "testsuites"
  add_foreign_key "sites", "users"
end
