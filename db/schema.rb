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

ActiveRecord::Schema.define(version: 20140623201407) do

  create_table "articles", force: true do |t|
    t.text     "english"
    t.text     "phonetic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "picture"
    t.integer  "language_id"
  end

  add_index "articles", ["language_id"], name: "index_articles_on_language_id"

  create_table "installations", force: true do |t|
    t.string   "installation"
    t.string   "email"
    t.text     "address"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.string   "name"
    t.integer  "installation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["installation_id"], name: "index_sites_on_installation_id"

end
