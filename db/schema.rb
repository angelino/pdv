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

ActiveRecord::Schema.define(version: 20150815224548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "public_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["owner_type", "owner_id"], name: "index_images_on_owner_type_and_owner_id", using: :btree

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

  add_index "sale_entries", ["sale_id"], name: "index_sale_entries_on_sale_id", using: :btree
  add_index "sale_entries", ["storage_entry_id"], name: "index_sale_entries_on_storage_entry_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "point_of_sale_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "storage_entries", force: :cascade do |t|
    t.string   "reason"
    t.integer  "quantity"
    t.integer  "point_of_sale_id"
    t.integer  "product_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "movement_date"
  end

  add_index "storage_entries", ["point_of_sale_id"], name: "index_storage_entries_on_point_of_sale_id", using: :btree
  add_index "storage_entries", ["product_id"], name: "index_storage_entries_on_product_id", using: :btree

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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "sale_entries", "sales"
  add_foreign_key "sale_entries", "storage_entries"
  add_foreign_key "sales", "point_of_sales"
  add_foreign_key "sales", "users"
  add_foreign_key "storage_entries", "point_of_sales"
  add_foreign_key "storage_entries", "products"
end
