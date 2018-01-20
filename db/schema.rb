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

ActiveRecord::Schema.define(version: 20180120140856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bag_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "bag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bag_id"], name: "index_bag_items_on_bag_id"
    t.index ["item_id"], name: "index_bag_items_on_item_id"
  end

  create_table "bags", force: :cascade do |t|
    t.bigint "hero_id"
    t.integer "size", default: 30, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_bags_on_hero_id"
  end

  create_table "environments", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "permeable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "hero_items", force: :cascade do |t|
    t.bigint "hero_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_hero_items_on_hero_id"
    t.index ["item_id"], name: "index_hero_items_on_item_id"
  end

  create_table "hero_roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "template_file_name"
    t.string "template_content_type"
    t.integer "template_file_size"
    t.datetime "template_updated_at"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.bigint "hero_role_id", null: false
    t.bigint "user_id", null: false
    t.integer "strength", default: 0, null: false
    t.integer "agility", default: 0, null: false
    t.integer "inteligence", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "current", default: false, null: false
    t.bigint "world_id", default: 4
    t.integer "position_x", default: 10
    t.integer "position_y", default: 10
    t.index ["hero_role_id"], name: "index_heros_on_hero_role_id"
    t.index ["user_id"], name: "index_heros_on_user_id"
    t.index ["world_id"], name: "index_heros_on_world_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "wear_place", null: false
    t.integer "damage", default: 0, null: false
    t.integer "mana", default: 0, null: false
    t.integer "armor", default: 0, null: false
    t.bigint "hero_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["hero_role_id"], name: "index_items_on_hero_role_id"
  end

  create_table "teleports", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["world_id"], name: "index_teleports_on_world_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "developer", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "world_environments", force: :cascade do |t|
    t.bigint "world_id", null: false
    t.bigint "environment_id", null: false
    t.integer "position_x", default: 0, null: false
    t.integer "position_y", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["environment_id"], name: "index_world_environments_on_environment_id"
    t.index ["world_id"], name: "index_world_environments_on_world_id"
  end

  create_table "world_teleports", force: :cascade do |t|
    t.bigint "world_id", null: false
    t.bigint "teleport_id", null: false
    t.integer "position_x", null: false
    t.integer "position_y", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teleport_id"], name: "index_world_teleports_on_teleport_id"
    t.index ["world_id"], name: "index_world_teleports_on_world_id"
  end

  create_table "worlds", force: :cascade do |t|
    t.string "name", null: false
    t.integer "required_level", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "width", default: 500, null: false
    t.integer "height", default: 500, null: false
    t.string "background_file_name"
    t.string "background_content_type"
    t.integer "background_file_size"
    t.datetime "background_updated_at"
  end

  add_foreign_key "bag_items", "bags"
  add_foreign_key "bag_items", "items"
  add_foreign_key "bags", "heros"
  add_foreign_key "hero_items", "heros"
  add_foreign_key "hero_items", "items"
  add_foreign_key "heros", "hero_roles"
  add_foreign_key "heros", "users"
  add_foreign_key "heros", "worlds"
  add_foreign_key "items", "hero_roles"
  add_foreign_key "teleports", "worlds"
  add_foreign_key "world_environments", "environments"
  add_foreign_key "world_environments", "worlds"
  add_foreign_key "world_teleports", "teleports"
  add_foreign_key "world_teleports", "worlds"
end
