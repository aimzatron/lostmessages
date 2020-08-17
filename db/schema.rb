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

ActiveRecord::Schema.define(version: 20200817081942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "project_messages", force: :cascade do |t|
    t.bigint "message_id"
    t.uuid "project_id", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.integer "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "message_id", "key"], name: "index_project_messages_on_project_id_and_message_id_and_key", unique: true
    t.index ["project_id"], name: "index_project_messages_on_project_id"
  end

  create_table "projects", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.boolean "project_complete", default: false
  end

end
