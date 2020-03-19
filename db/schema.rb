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

ActiveRecord::Schema.define(version: 2020_03_19_160832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "alpha2code"
    t.string "alpha3code"
    t.string "region"
    t.string "french_name"
    t.string "flag_url"
  end

  create_table "countries_vaccines", id: false, force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "vaccine_id", null: false
  end

  create_table "travel_countries", force: :cascade do |t|
    t.bigint "travel_id", null: false
    t.bigint "country_id", null: false
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_travel_countries_on_country_id"
    t.index ["travel_id"], name: "index_travel_countries_on_travel_id"
  end

  create_table "travels", force: :cascade do |t|
    t.string "name"
    t.date "travel_start_date"
    t.date "travel_end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_travels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "nationality"
    t.string "gender"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vaccines", force: :cascade do |t|
    t.string "name"
    t.date "treatment_start_date"
    t.date "treatment_end_date"
    t.date "injection_max_date"
    t.string "contraindications"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visas", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.date "deliverance_max_date"
    t.integer "duration"
    t.integer "price"
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_visas_on_country_id"
  end

  add_foreign_key "travel_countries", "countries"
  add_foreign_key "travel_countries", "travels"
  add_foreign_key "travels", "users"
  add_foreign_key "visas", "countries"
end
