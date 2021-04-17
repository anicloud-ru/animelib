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

ActiveRecord::Schema.define(version: 2021_04_17_141346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animes", force: :cascade do |t|
    t.string "canonical"
    t.string "russian"
    t.string "optionally"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kind"
    t.string "status"
    t.integer "episodes_number"
    t.string "age_rating"
    t.text "description_ru"
    t.text "description_en"
    t.integer "duration"
    t.float "score"
    t.string "genres_ids", array: true
    t.date "aired_on"
    t.date "released_on"
    t.string "franchise"
    t.string "fandubbers", array: true
    t.integer "hashtags_ids", array: true
  end

  create_table "arcs", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.integer "series", array: true
    t.bigint "anime_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_arcs_on_anime_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "canonical"
    t.string "russian"
    t.string "optionally"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "name"
    t.integer "popularity"
    t.bigint "searches"
    t.integer "day_searches"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
