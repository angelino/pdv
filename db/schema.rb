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

ActiveRecord::Schema.define(version: 20150901214429) do

  create_table "account_entries", force: :cascade do |t|
    t.decimal  "value",                precision: 8, scale: 2
    t.date     "date"
    t.integer  "origin_id"
    t.string   "origin_type"
    t.integer  "financial_account_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "account_entries", ["financial_account_id"], name: "index_account_entries_on_financial_account_id"
  add_index "account_entries", ["origin_type", "origin_id"], name: "index_account_entries_on_origin_type_and_origin_id"

  create_table "financial_accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "public_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["owner_type", "owner_id"], name: "index_images_on_owner_type_and_owner_id"

  create_table "point_of_sales", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "barcode"
  end

  create_table "sale_entries", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "storage_entry_id"
    t.integer  "quantity"
    t.decimal  "price_at_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "sale_entries", ["sale_id"], name: "index_sale_entries_on_sale_id"
  add_index "sale_entries", ["storage_entry_id"], name: "index_sale_entries_on_storage_entry_id"

  create_table "sales", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "point_of_sale_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "stock_entry_types", force: :cascade do |t|
    t.string   "reason"
    t.boolean  "plus_minus_marker"
    t.boolean  "sell_marker"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "storage_entries", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "point_of_sale_id"
    t.integer  "product_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.date     "movement_date"
    t.integer  "storage_entry_type_id"
  end

  add_index "storage_entries", ["point_of_sale_id"], name: "index_storage_entries_on_point_of_sale_id"
  add_index "storage_entries", ["product_id"], name: "index_storage_entries_on_product_id"
  add_index "storage_entries", ["storage_entry_type_id"], name: "index_storage_entries_on_storage_entry_type_id"

  create_table "storage_entry_types", force: :cascade do |t|
    t.string   "reason"
    t.boolean  "plus_minus_marker"
    t.boolean  "sell_marker"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
