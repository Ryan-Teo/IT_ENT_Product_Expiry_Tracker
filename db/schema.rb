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

ActiveRecord::Schema.define(version: 20170928091146) do

  create_table "batches", id: false, force: :cascade do |t|
    t.string   "batchID",    null: false
    t.string   "productID",  null: false
    t.integer  "quantity"
    t.date     "expiryDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "product_id"
  end

  add_index "batches", ["product_id"], name: "index_batches_on_product_id"

  create_table "products", id: false, force: :cascade do |t|
    t.string   "productID",                           null: false
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       precision: 5, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "batch_ids"
  end

  create_table "sales", id: false, force: :cascade do |t|
    t.string   "saleID",        null: false
    t.integer  "batchID"
    t.float    "salePrice"
    t.date     "saleStartDate"
    t.date     "saleEndDate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
