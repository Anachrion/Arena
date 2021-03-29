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

ActiveRecord::Schema.define(version: 2021_03_28_212017) do

  create_table "actions", force: :cascade do |t|
    t.integer "assaillant_id"
    t.integer "defender_id"
    t.integer "fight_id"
    t.integer "hit_roll", default: 0
    t.integer "damage", default: 0
    t.integer "turn", default: 0
    t.integer "defender_hp_left"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assaillant_id"], name: "index_actions_on_assaillant_id"
    t.index ["defender_id"], name: "index_actions_on_defender_id"
    t.index ["fight_id"], name: "index_actions_on_fight_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "hit_points", default: 0
    t.integer "strength", default: 0
    t.integer "precision", default: 0
    t.integer "level", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fighters_fights", id: false, force: :cascade do |t|
    t.integer "fight_id", null: false
    t.integer "fighter_id", null: false
    t.index ["fight_id"], name: "index_fighters_fights_on_fight_id"
    t.index ["fighter_id"], name: "index_fighters_fights_on_fighter_id"
  end

  create_table "fights", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "winner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "first_fighter_weapon_id"
    t.integer "second_fighter_weapon_id"
    t.index ["first_fighter_weapon_id"], name: "index_fights_on_first_fighter_weapon_id"
    t.index ["second_fighter_weapon_id"], name: "index_fights_on_second_fighter_weapon_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "precision_modifier", default: 0
    t.integer "damage_modifier", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "actions", "fighters", column: "assaillant_id"
  add_foreign_key "actions", "fighters", column: "defender_id"
  add_foreign_key "actions", "fights"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "fights", "fighters", column: "winner_id"
  add_foreign_key "fights", "weapons", column: "first_fighter_weapon_id"
  add_foreign_key "fights", "weapons", column: "second_fighter_weapon_id"
end
