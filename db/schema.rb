# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_08_084756) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "size_id", null: false
    t.string "ref_id", null: false
    t.integer "quantity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ref_id", "size_id"], name: "index_cart_items_on_ref_id_and_size_id", unique: true
    t.index ["size_id"], name: "index_cart_items_on_size_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "brand"
    t.string "name", null: false
    t.boolean "private", default: false, null: false
    t.string "barcode"
    t.string "units"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_sizes_on_item_id"
  end

  add_foreign_key "cart_items", "sizes"
  add_foreign_key "sizes", "items"
end
