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

ActiveRecord::Schema.define(version: 2021_04_22_090536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.string "poster_file_name"
    t.string "poster_content_type"
    t.bigint "poster_file_size"
    t.datetime "poster_updated_at"
  end

  create_table "arcs", force: :cascade do |t|
    t.string "russian"
    t.integer "number"
    t.integer "episodes", array: true
    t.bigint "anime_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "canonical"
    t.string "poster_file_name"
    t.string "poster_content_type"
    t.bigint "poster_file_size"
    t.datetime "poster_updated_at"
    t.index ["anime_id"], name: "index_arcs_on_anime_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "canonical"
    t.string "russian"
    t.bigint "anime_id"
    t.integer "episode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_episodes_on_anime_id"
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

  create_table "videos", force: :cascade do |t|
    t.string "name"
    t.string "url", default: "s3"
    t.integer "user_id", default: 0
    t.integer "likes", default: 0
    t.integer "dislikes", default: 0
    t.integer "views", default: 0
    t.string "kind", default: "fandub"
    t.string "status", default: "created"
    t.string "fandub"
    t.string "fansub"
    t.bigint "episode_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video_file_name"
    t.string "video_content_type"
    t.bigint "video_file_size"
    t.datetime "video_updated_at"
    t.index ["episode_id"], name: "index_videos_on_episode_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
