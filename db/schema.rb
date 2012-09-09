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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120909103135) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "biography"
    t.string   "website"
    t.integer  "image_id"
    t.string   "email"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "phone"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "slug"
    t.string   "media"
    t.text     "short_description"
  end

  add_index "artists", ["image_id"], :name => "index_artists_on_image_id"
  add_index "artists", ["slug"], :name => "index_artists_on_slug", :unique => true

  create_table "artists_exhibits", :id => false, :force => true do |t|
    t.integer "artist_id"
    t.integer "exhibit_id"
  end

  add_index "artists_exhibits", ["artist_id", "exhibit_id"], :name => "index_artists_exhibits_on_artist_id_and_exhibit_id"
  add_index "artists_exhibits", ["exhibit_id", "artist_id"], :name => "index_artists_exhibits_on_exhibit_id_and_artist_id"

  create_table "artwork", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "image_id"
    t.integer  "exhibit_id"
    t.integer  "artist_id"
    t.datetime "date"
    t.integer  "year"
    t.string   "location"
    t.string   "medium"
    t.string   "size"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "artwork", ["artist_id"], :name => "index_artwork_on_artist_id"
  add_index "artwork", ["exhibit_id"], :name => "index_artwork_on_exhibit_id"

  create_table "artworks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "image_id"
    t.integer  "exhibit_id"
    t.integer  "artist_id"
    t.datetime "date"
    t.integer  "year"
    t.string   "location"
    t.string   "medium"
    t.string   "size"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "artworks", ["artist_id"], :name => "index_artworks_on_artist_id"
  add_index "artworks", ["exhibit_id"], :name => "index_artworks_on_exhibit_id"
  add_index "artworks", ["slug"], :name => "index_artworks_on_slug", :unique => true

  create_table "artworkwork", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "image_id"
    t.integer  "exhibit_id"
    t.integer  "artist_id"
    t.datetime "date"
    t.integer  "year"
    t.string   "location"
    t.string   "medium"
    t.string   "size"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "artworkwork", ["artist_id"], :name => "index_artworkwork_on_artist_id"
  add_index "artworkwork", ["exhibit_id"], :name => "index_artworkwork_on_exhibit_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cms", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "category"
  end

  create_table "contacts", :force => true do |t|
    t.string   "phone"
    t.string   "email"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "data_stores", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "date"
    t.integer  "image_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "exhibits", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "year"
    t.datetime "start"
    t.datetime "end"
    t.string   "hours"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "slug"
    t.integer  "image_id"
    t.text     "short_description"
  end

  add_index "exhibits", ["slug"], :name => "index_exhibits_on_slug", :unique => true

  create_table "homes", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "text"
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "location"
    t.string   "slug"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category_id"
  end

  create_table "visits", :force => true do |t|
    t.string   "hours"
    t.string   "days"
    t.text     "address"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "description"
    t.integer  "image_id"
    t.text     "directions_text"
    t.string   "directions_link"
  end

end
