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

ActiveRecord::Schema.define(version: 2019_06_10_093338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.text "tags", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes_line_questions", force: :cascade do |t|
    t.bigint "notes_question_id"
    t.bigint "notes_line_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notes_line_id"], name: "index_notes_line_questions_on_notes_line_id"
    t.index ["notes_question_id"], name: "index_notes_line_questions_on_notes_question_id"
  end

  create_table "notes_lines", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notes_template_id"
    t.integer "order"
    t.index ["notes_template_id"], name: "index_notes_lines_on_notes_template_id"
  end

  create_table "notes_questions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "input"
    t.string "selections", default: [], array: true
    t.string "placeholder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes_templates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "notes_line_questions", "notes_lines"
  add_foreign_key "notes_line_questions", "notes_questions"
end
