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

ActiveRecord::Schema.define(version: 20180922003934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cursos", force: :cascade do |t|
    t.text "nome_do_curso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculdades", force: :cascade do |t|
    t.string "nome"
    t.decimal "nota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nota_por_cursos", force: :cascade do |t|
    t.integer "faculdade_id"
    t.integer "curso_id"
    t.decimal "nota"
    t.decimal "media_alunos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculdade_id", "curso_id"], name: "index_nota_por_cursos_on_faculdade_id_and_curso_id", unique: true
  end

end
