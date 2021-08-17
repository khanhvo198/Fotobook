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

ActiveRecord::Schema.define(version: 2021_08_17_155736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_images", force: :cascade do |t|
    t.string "img_url"
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "photos_url"
    t.bigint "user_id"
    t.string "privacy"
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follower_id"
    t.index ["user_id"], name: "index_followers_on_user_id"
  end

  create_table "followings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "following_id"
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "photo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "privacy"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "is_admin"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "albums", "users"
  add_foreign_key "followers", "users"
  add_foreign_key "followings", "users"
  add_foreign_key "photos", "users"
end
