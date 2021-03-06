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

ActiveRecord::Schema.define(version: 2019_06_19_083737) do

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
  end

  create_table "notes_part_lines", force: :cascade do |t|
    t.bigint "notes_part_id"
    t.bigint "notes_line_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notes_line_id"], name: "index_notes_part_lines_on_notes_line_id"
    t.index ["notes_part_id"], name: "index_notes_part_lines_on_notes_part_id"
  end

  create_table "notes_parts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "notes_template_parts", force: :cascade do |t|
    t.bigint "notes_template_id"
    t.bigint "notes_part_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "static", default: false
    t.index ["notes_part_id"], name: "index_notes_template_parts_on_notes_part_id"
    t.index ["notes_template_id"], name: "index_notes_template_parts_on_notes_template_id"
  end

  create_table "notes_templates", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes_trigger_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes_triggers", force: :cascade do |t|
    t.string "name"
    t.bigint "notes_template_part_id"
    t.bigint "notes_line_question_id"
    t.bigint "triggered_notes_template_part_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "notes_trigger_type_id"
    t.index ["notes_line_question_id"], name: "index_notes_triggers_on_notes_line_question_id"
    t.index ["notes_template_part_id"], name: "index_notes_triggers_on_notes_template_part_id"
    t.index ["notes_trigger_type_id"], name: "index_notes_triggers_on_notes_trigger_type_id"
    t.index ["triggered_notes_template_part_id"], name: "index_notes_triggers_on_triggered_notes_template_part_id"
  end

  add_foreign_key "notes_line_questions", "notes_lines"
  add_foreign_key "notes_line_questions", "notes_questions"
  add_foreign_key "notes_part_lines", "notes_lines"
  add_foreign_key "notes_part_lines", "notes_parts"
  add_foreign_key "notes_template_parts", "notes_parts"
  add_foreign_key "notes_template_parts", "notes_templates"
  add_foreign_key "notes_triggers", "notes_line_questions"
  add_foreign_key "notes_triggers", "notes_template_parts"
  add_foreign_key "notes_triggers", "notes_template_parts", column: "triggered_notes_template_part_id"
end
