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

ActiveRecord::Schema.define(version: 20170112111225) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "contents", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_contents_on_code", unique: true
  end

  create_table "prospect_contents", force: :cascade do |t|
    t.integer  "prospect_id"
    t.integer  "content_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["content_id"], name: "index_prospect_contents_on_content_id"
    t.index ["prospect_id"], name: "index_prospect_contents_on_prospect_id"
  end

  create_table "prospects", force: :cascade do |t|
    t.string   "contact"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_prospects_on_city_id"
  end

end
