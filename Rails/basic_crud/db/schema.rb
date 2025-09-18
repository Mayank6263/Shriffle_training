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

ActiveRecord::Schema[8.0].define(version: 2025_09_18_094330) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string "p1"
    t.string "p2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "data_json", default: {}
    t.jsonb "data_jsonb", default: {}
    t.bigint "user_id", null: false
    t.index ["data_jsonb"], name: "index_posts_on_data_jsonb", using: :gin
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "posts_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "price"
    t.string "type"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "midiator_type", null: false
    t.bigint "midiator_id", null: false
    t.date "joined"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["midiator_type", "midiator_id"], name: "index_profiles_on_midiator"
  end

  create_table "supressmessages", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "posts", "users"
end
