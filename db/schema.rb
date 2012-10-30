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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121030211908) do

  create_table "areas", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "areas", ["name"], :name => "index_areas_on_name", :unique => true

  create_table "assuntos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assuntos", ["name"], :name => "index_assuntos_on_name", :unique => true

  create_table "atribuicaos", :force => true do |t|
    t.integer  "verbo_id"
    t.integer  "area_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "atribuicaos", ["area_id"], :name => "index_atribuicaos_on_area_id"
  add_index "atribuicaos", ["verbo_id", "area_id"], :name => "index_atribuicaos_on_verbo_id_and_area_id", :unique => true
  add_index "atribuicaos", ["verbo_id"], :name => "index_atribuicaos_on_verbo_id"

  create_table "cargo_atribuicaos", :force => true do |t|
    t.integer  "cargo_id"
    t.integer  "atribuicao_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "cargo_atribuicaos", ["atribuicao_id"], :name => "index_cargo_atribuicaos_on_atribuicao_id"
  add_index "cargo_atribuicaos", ["cargo_id", "atribuicao_id"], :name => "index_cargo_atribuicaos_on_cargo_id_and_atribuicao_id", :unique => true
  add_index "cargo_atribuicaos", ["cargo_id"], :name => "index_cargo_atribuicaos_on_cargo_id"

  create_table "cargos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cargos", ["name"], :name => "index_cargos_on_name", :unique => true

  create_table "classe_atribuicaos", :force => true do |t|
    t.integer  "classe_id"
    t.integer  "atribuicao_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "classe_atribuicaos", ["atribuicao_id"], :name => "index_classe_atribuicaos_on_atribuicao_id"
  add_index "classe_atribuicaos", ["classe_id", "atribuicao_id"], :name => "index_classe_atribuicaos_on_classe_id_and_atribuicao_id", :unique => true
  add_index "classe_atribuicaos", ["classe_id"], :name => "index_classe_atribuicaos_on_classe_id"

  create_table "classes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "classes", ["name"], :name => "index_classes_on_name", :unique => true

  create_table "verbos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "verbos", ["name"], :name => "index_verbos_on_name", :unique => true

end
