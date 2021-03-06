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

ActiveRecord::Schema.define(version: 20160402053855) do

  create_table "car_brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "car_brand_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "car_models", ["car_brand_id"], name: "index_car_models_on_car_brand_id"

  create_table "cars", force: :cascade do |t|
    t.string   "plate_number"
    t.integer  "car_model_id"
    t.string   "contact_number"
    t.string   "model_year"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "cars", ["car_model_id"], name: "index_cars_on_car_model_id"
  add_index "cars", ["user_id"], name: "index_cars_on_user_id"

  create_table "cars_todo_lists", force: :cascade do |t|
    t.string   "car_plate_number"
    t.string   "car_owner_email"
    t.datetime "pickedup_at"
    t.datetime "ready_for_pickup_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "cars_todo_list_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "comments", ["cars_todo_list_id"], name: "index_comments_on_cars_todo_list_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.boolean  "availability"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "service_todos", force: :cascade do |t|
    t.string   "content"
    t.integer  "cars_todo_list_id"
    t.datetime "completed_at"
    t.datetime "started_at"
    t.datetime "paid_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.decimal  "price"
  end

  add_index "service_todos", ["cars_todo_list_id"], name: "index_service_todos_on_cars_todo_list_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_number"
    t.text     "address"
    t.boolean  "admin"
    t.string   "technician"
    t.string   "boolean"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
