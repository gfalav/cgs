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

ActiveRecord::Schema.define(:version => 20120528230131) do

  create_table "condclimas", :force => true do |t|
    t.integer  "zona_id"
    t.string   "nombre"
    t.decimal  "temp"
    t.decimal  "viento"
    t.decimal  "hielo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "conductors", :force => true do |t|
    t.string   "nombre"
    t.decimal  "diametro"
    t.decimal  "seccion"
    t.decimal  "peso"
    t.decimal  "rmec"
    t.decimal  "coef_e"
    t.decimal  "coef_t"
    t.decimal  "imax"
    t.decimal  "relec"
    t.decimal  "tmax"
    t.decimal  "tmed"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "proyectos", :force => true do |t|
    t.string   "proyecto"
    t.string   "desc"
    t.string   "comitente"
    t.string   "constructor"
    t.string   "proyectista"
    t.date     "fproyecto"
    t.string   "ubicacion"
    t.string   "expediente"
    t.integer  "cond_e_id"
    t.integer  "cond_g_id"
    t.integer  "zona_id"
    t.integer  "tconstr_id"
    t.decimal  "vanomax"
    t.decimal  "dretmax"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "puntos", :force => true do |t|
    t.string   "punto"
    t.integer  "proyecto_id"
    t.integer  "secuencia"
    t.decimal  "latitud"
    t.decimal  "longitud"
    t.decimal  "distancia"
    t.decimal  "angulo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "zonas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
