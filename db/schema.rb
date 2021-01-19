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

ActiveRecord::Schema.define(version: 2021_01_19_162532) do

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "date"
    t.integer "photographer_id"
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location"
    t.index ["client_id"], name: "index_albums_on_client_id"
    t.index ["photographer_id"], name: "index_albums_on_photographer_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

  create_table "photographers", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "location"
    t.string "specialty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "date"
    t.integer "album_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_photos_on_album_id"
  end

  add_foreign_key "albums", "clients"
  add_foreign_key "albums", "photographers"
  add_foreign_key "photos", "albums"
end
