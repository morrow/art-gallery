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

ActiveRecord::Schema.define(version: 20150529202407) do

  create_table "artists", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "biography",         limit: 255
    t.string   "website",           limit: 255
    t.integer  "image_id"
    t.string   "email",             limit: 255
    t.string   "facebook",          limit: 255
    t.string   "twitter",           limit: 255
    t.string   "phone",             limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "slug",              limit: 255
    t.string   "media",             limit: 255
    t.text     "short_description"
  end

  add_index "artists", ["image_id"], name: "index_artists_on_image_id"
  add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true

  create_table "artists_exhibits", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "exhibit_id"
  end

  add_index "artists_exhibits", ["artist_id", "exhibit_id"], name: "index_artists_exhibits_on_artist_id_and_exhibit_id"
  add_index "artists_exhibits", ["exhibit_id", "artist_id"], name: "index_artists_exhibits_on_exhibit_id_and_artist_id"

  create_table "artwork", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.integer  "image_id"
    t.integer  "exhibit_id"
    t.integer  "artist_id"
    t.datetime "date"
    t.integer  "year"
    t.string   "location",    limit: 255
    t.string   "medium",      limit: 255
    t.string   "size",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "artwork", ["artist_id"], name: "index_artwork_on_artist_id"
  add_index "artwork", ["exhibit_id"], name: "index_artwork_on_exhibit_id"

  create_table "artworks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.integer  "image_id"
    t.integer  "exhibit_id"
    t.integer  "artist_id"
    t.datetime "date"
    t.integer  "year"
    t.string   "location",    limit: 255
    t.string   "medium",      limit: 255
    t.string   "size",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug",        limit: 255
  end

  add_index "artworks", ["artist_id"], name: "index_artworks_on_artist_id"
  add_index "artworks", ["exhibit_id"], name: "index_artworks_on_exhibit_id"
  add_index "artworks", ["slug"], name: "index_artworks_on_slug", unique: true

  create_table "artworkwork", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.integer  "image_id"
    t.integer  "exhibit_id"
    t.integer  "artist_id"
    t.datetime "date"
    t.integer  "year"
    t.string   "location",    limit: 255
    t.string   "medium",      limit: 255
    t.string   "size",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "artworkwork", ["artist_id"], name: "index_artworkwork_on_artist_id"
  add_index "artworkwork", ["exhibit_id"], name: "index_artworkwork_on_exhibit_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cms", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.string   "value",      limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "category",   limit: 255
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "facebook"
    t.string   "twitter"
    t.string   "flickr"
    t.string   "instagram"
  end

  create_table "data_stores", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "date"
    t.integer  "image_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "exhibits", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "description",       limit: 255
    t.integer  "year"
    t.datetime "start"
    t.datetime "end"
    t.string   "hours",             limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "slug",              limit: 255
    t.integer  "image_id"
    t.text     "short_description"
  end

  add_index "exhibits", ["slug"], name: "index_exhibits_on_slug", unique: true

  create_table "homes", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "subtitle",   limit: 255
    t.text     "text"
    t.integer  "image_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "location",           limit: 255
    t.string   "slug",               limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category_id"
  end

  create_table "visits", force: :cascade do |t|
    t.string   "hours",           limit: 255
    t.string   "days",            limit: 255
    t.text     "address"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "description"
    t.integer  "image_id"
    t.text     "directions_text"
    t.string   "directions_link", limit: 255
  end

end
