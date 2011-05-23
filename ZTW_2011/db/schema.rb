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

ActiveRecord::Schema.define(:version => 20110523214205) do

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "basic"
  end

  create_table "orders", :force => true do |t|
    t.datetime "finishTime"
    t.boolean  "wasPaid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "firstName"
    t.string   "surname"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
  end

  create_table "pizzas", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_id",  :default => 1, :null => false
    t.integer  "order_id"
  end

  create_table "pizzas_ingredients", :id => false, :force => true do |t|
    t.integer "pizza_id"
    t.integer "ingredient_id"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes_ingredients", :id => false, :force => true do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "surname"
    t.string   "firstName"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
