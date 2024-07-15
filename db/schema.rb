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

ActiveRecord::Schema[7.1].define(version: 20_240_713_112_532) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tg_chats", primary_key: "tg_id", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
  end

  create_table "tg_messages", primary_key: "tg_id", force: :cascade do |t|
    t.bigint "tg_chat_id"
    t.integer "tg_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tg_users", primary_key: "tg_id", force: :cascade do |t|
    t.string "name"
    t.string "tg_name"
    t.boolean "worker", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "login", default: "", null: false
    t.string "name"
    t.integer "tg_user_id"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end
end
