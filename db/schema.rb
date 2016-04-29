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

ActiveRecord::Schema.define(version: 20160424205156) do

  create_table "amendments", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "sponsor"
    t.integer  "resolution_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "amendments", ["resolution_id"], name: "index_amendments_on_resolution_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.integer  "resource"
    t.integer  "r_energy"
    t.integer  "n_energy"
    t.integer  "f_military"
    t.integer  "u_military"
    t.integer  "tech"
    t.integer  "education"
    t.integer  "infrastructure"
    t.integer  "funds"
    t.integer  "population"
    t.float    "economy"
    t.float    "quality"
    t.float    "happiness"
    t.float    "climate"
    t.float    "e_metric"
    t.float    "r_metric"
    t.float    "f_metric"
    t.float    "c_metric"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "inters", force: :cascade do |t|
    t.float    "global"
    t.float    "iclimate"
    t.float    "iquality"
    t.integer  "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resolution_countries", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "country_id"
    t.integer  "resolution_id"
    t.integer  "source_id"
  end

  create_table "resolutions", force: :cascade do |t|
    t.string   "name"
    t.string   "topic"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
