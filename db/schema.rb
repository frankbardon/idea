# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090611025620) do

  create_table "ideas", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "ip",          :limit => 15
    t.string   "client"
    t.string   "lang",        :limit => 5
    t.string   "geo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "ideas", ["user_id"], :name => "index_ideas_on_user_id"

  create_table "pieces", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "ip",          :limit => 15
    t.string   "client"
    t.string   "lang",        :limit => 5
    t.string   "geo"
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ideas_count"
    t.string   "single_access_token"
  end

end
