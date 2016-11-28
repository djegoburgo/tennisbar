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

ActiveRecord::Schema.define(version: 20161128170338) do

  create_table "firstentries", force: :cascade do |t|
    t.integer  "draw_position"
    t.integer  "match_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "player_id"
  end

  add_index "firstentries", ["match_id"], name: "index_firstentries_on_match_id"
  add_index "firstentries", ["player_id"], name: "index_firstentries_on_player_id"

  create_table "matches", force: :cascade do |t|
    t.string   "status"
    t.integer  "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matches", ["round_id"], name: "index_matches_on_round_id"

  create_table "players", force: :cascade do |t|
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "selection_id"
  end

  add_index "players", ["selection_id"], name: "index_players_on_selection_id"

  create_table "rounds", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rounds", ["tournament_id"], name: "index_rounds_on_tournament_id"

  create_table "scores", force: :cascade do |t|
    t.string   "result_type"
    t.integer  "number_of_sets"
    t.integer  "winning_entry_id"
    t.integer  "match_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "scores", ["match_id"], name: "index_scores_on_match_id"

  create_table "secondentries", force: :cascade do |t|
    t.integer  "draw_position"
    t.integer  "match_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "player_id"
  end

  add_index "secondentries", ["match_id"], name: "index_secondentries_on_match_id"
  add_index "secondentries", ["player_id"], name: "index_secondentries_on_player_id"

  create_table "selections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.string   "surface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
