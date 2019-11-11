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

ActiveRecord::Schema.define(version: 2019_11_09_144335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.date "effective_date"
    t.boolean "checked"
    t.string "check_number"
    t.string "comment"
    t.float "value"
    t.bigint "account_id", null: false
    t.bigint "category_id", null: false
    t.bigint "recurrent_entry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_entries_on_account_id"
    t.index ["category_id"], name: "index_entries_on_category_id"
    t.index ["recurrent_entry_id"], name: "index_entries_on_recurrent_entry_id"
  end

  create_table "recurrent_entries", force: :cascade do |t|
    t.boolean "active"
    t.boolean "checked"
    t.string "comment"
    t.float "value"
    t.string "frequency"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_recurrent_entries_on_account_id"
    t.index ["category_id"], name: "index_recurrent_entries_on_category_id"
    t.index ["user_id"], name: "index_recurrent_entries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "entries", "accounts"
  add_foreign_key "entries", "categories"
  add_foreign_key "recurrent_entries", "accounts"
  add_foreign_key "recurrent_entries", "categories"
  add_foreign_key "recurrent_entries", "users"
end
