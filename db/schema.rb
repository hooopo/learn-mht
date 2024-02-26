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

ActiveRecord::Schema[7.2].define(version: 2024_02_25_090852) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "signer", null: false
    t.integer "timestamp", null: false
    t.string "data", null: false
    t.string "hashed_data", null: false
    t.string "signed_hashed_data", null: false
  end

  create_table "merkle_tree_leaf_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "merkle_tree_leaf_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "merkle_tree_leaf_desc_idx"
  end

  create_table "merkle_tree_leaves", force: :cascade do |t|
    t.integer "parent_id"
    t.string "signer", null: false
    t.integer "timestamp", null: false
    t.string "data"
    t.string "hashed_data", null: false
    t.string "signed_hashed_data", null: false
  end
end
