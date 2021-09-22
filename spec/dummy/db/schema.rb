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

ActiveRecord::Schema.define(version: 2021_09_22_152748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mub_properties", force: :cascade do |t|
    t.bigint "template_id", null: false
    t.bigint "property_setting_id", null: false
    t.jsonb "value"
    t.boolean "allow_modify", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_setting_id", "template_id"], name: "index_mub_properties_on_property_setting_id_and_template_id", unique: true
    t.index ["property_setting_id"], name: "index_mub_properties_on_property_setting_id"
    t.index ["template_id"], name: "index_mub_properties_on_template_id"
  end

  create_table "mub_property_settings", force: :cascade do |t|
    t.string "name", null: false
    t.string "resource_type", null: false
    t.string "setter_method_name", null: false
    t.string "target_column", null: false
    t.string "fk_entity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_type"], name: "index_mub_property_settings_on_resource_type"
  end

  create_table "mub_tag_associations", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "template_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_mub_tag_associations_on_tag_id"
    t.index ["template_id"], name: "index_mub_tag_associations_on_template_id"
  end

  create_table "mub_tags", force: :cascade do |t|
    t.string "name", null: false
    t.string "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mub_templates", force: :cascade do |t|
    t.string "resource_type", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "activated_at"
    t.string "classification", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activated_at"], name: "index_mub_templates_on_activated_at"
    t.index ["resource_type", "name"], name: "index_mub_templates_on_resource_type_and_name", unique: true
  end

end
