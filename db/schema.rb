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

ActiveRecord::Schema.define(version: 2018_06_30_175237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "session_id", limit: 32, null: false
    t.integer "score", default: 0, null: false
    t.string "name", limit: 15, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_players_on_session_id", unique: true
  end

  create_table "round_items", force: :cascade do |t|
    t.bigint "round_id"
    t.integer "row", null: false
    t.integer "column", null: false
    t.integer "target_type", null: false
    t.integer "targeted_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id", "row", "column"], name: "index_round_items_on_round_id_and_row_and_column", unique: true
    t.index ["round_id"], name: "index_round_items_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "round_items", "players", column: "targeted_by_id"
  add_foreign_key "round_items", "rounds"
  add_foreign_key "rounds", "players", column: "winner_id"
end
