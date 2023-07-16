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

ActiveRecord::Schema.define(version: 2023_06_03_074347) do

  create_table "skill_categories", force: :cascade do |t|
    t.string "skill_category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skill_details", force: :cascade do |t|
    t.string "skill_name"
    t.integer "skill_level"
    t.integer "user_id", null: false
    t.integer "skill_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_category_id"], name: "index_skill_details_on_skill_category_id"
    t.index ["user_id"], name: "index_skill_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.text "self_introduction"
    t.binary "profile_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "skill_details", "skill_categories"
  add_foreign_key "skill_details", "users"
end
