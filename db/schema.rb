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

ActiveRecord::Schema.define(version: 20140314160539) do

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: true do |t|
    t.string   "username",                 default: "",    null: false
    t.string   "email",                    default: "",    null: false
    t.string   "encrypted_password",       default: "",    null: false
    t.boolean  "admin",                    default: false, null: false
    t.boolean  "locked",                   default: false, null: false
    t.string   "slug"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lose_fat_and_tone"
    t.string   "better_my_endurance"
    t.string   "get_stronger"
    t.string   "connect_my_mind_and_body"
    t.string   "eat_better"
    t.string   "units"
    t.integer  "weight"
    t.integer  "height"
    t.date     "birthday"
    t.boolean  "doctor_clearance"
    t.boolean  "currently_pregnant"
    t.boolean  "heart_condition"
    t.boolean  "shortness_breath"
    t.boolean  "unusual_fatigue"
    t.boolean  "coronary_heart_disease"
    t.boolean  "high_pressure"
    t.boolean  "stroke"
    t.boolean  "diabetes"
    t.boolean  "thyroid_problems"
    t.boolean  "head_injury_epilepsy"
    t.boolean  "hepatitis"
    t.boolean  "arthritis"
    t.boolean  "chronic_severe_headaches"
    t.boolean  "anemia"
    t.boolean  "liver_problems"
    t.boolean  "lung_problems"
    t.boolean  "others"
    t.boolean  "no"
    t.string   "contact_time_window"
    t.string   "contact_phone_number"
    t.boolean  "own_roku"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "reg_phone"
    t.boolean  "plan_1_monthly"
    t.boolean  "plan_1_trimonthly"
    t.boolean  "plan_2_monthly"
    t.boolean  "plan2_trimonthly"
    t.string   "card_type"
    t.string   "card_number"
    t.integer  "exp_month"
    t.integer  "exp_year"
    t.integer  "cvv"
    t.string   "discount_code"
    t.string   "billing_first_name"
    t.string   "billing_last_name"
    t.string   "billing_address_1"
    t.string   "billing_address_2"
    t.string   "billing_city"
    t.string   "billing_state"
    t.integer  "billing_zip"
    t.string   "billing_country"
    t.string   "billing_phone"
    t.string   "customer_id"
    t.string   "last_4_digits"
    t.string   "stripe_token"
    t.string   "coupon"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
