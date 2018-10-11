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

ActiveRecord::Schema.define(version: 2018_10_11_152403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string "file"
    t.string "entity_type"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id", "entity_type"], name: "index_attachments_on_entity_id_and_entity_type"
    t.index ["entity_type", "entity_id"], name: "index_attachments_on_entity_type_and_entity_id"
  end

  create_table "challenge_users", force: :cascade do |t|
    t.bigint "challenge_id"
    t.bigint "user_id"
    t.datetime "fechainicio"
    t.datetime "fechafin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenge_users_on_challenge_id"
    t.index ["user_id"], name: "index_challenge_users_on_user_id"
  end

  create_table "challengelevels", force: :cascade do |t|
    t.string "descripcion"
    t.integer "puntos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.bigint "challengelevel_id"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challengelevel_id"], name: "index_challenges_on_challengelevel_id"
  end

  create_table "complaint_users", force: :cascade do |t|
    t.bigint "complaint_id"
    t.bigint "user_id"
    t.string "direccion"
    t.string "comentarios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complaint_id"], name: "index_complaint_users_on_complaint_id"
    t.index ["user_id"], name: "index_complaint_users_on_user_id"
  end

  create_table "complaintfiles", force: :cascade do |t|
    t.bigint "complaint_user_id"
    t.string "descripcion"
    t.string "archivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complaint_user_id"], name: "index_complaintfiles_on_complaint_user_id"
  end

  create_table "complaints", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_users", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "user_id"
    t.datetime "fechainicio"
    t.datetime "fechafin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_users_on_course_id"
    t.index ["user_id"], name: "index_course_users_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "nombre"
    t.string "contenido"
    t.integer "puntos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "primerApellido"
    t.string "segundoApellido"
    t.integer "puntosAcumulados"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "token"
    t.boolean "blocked", default: false
    t.datetime "blocked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "challenge_users", "challenges"
  add_foreign_key "challenge_users", "users"
  add_foreign_key "challenges", "challengelevels"
  add_foreign_key "complaint_users", "complaints"
  add_foreign_key "complaint_users", "users"
  add_foreign_key "complaintfiles", "complaint_users"
  add_foreign_key "course_users", "courses"
  add_foreign_key "course_users", "users"
end
