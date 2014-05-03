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

ActiveRecord::Schema.define(:version => 20140503040829) do

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "interests", :force => true do |t|
    t.string  "name"
    t.integer "category_id"
    t.integer "user_id"
  end

  create_table "reputations", :force => true do |t|
    t.integer "score"
    t.integer "user_id"
  end

  create_table "skills", :force => true do |t|
    t.string  "name"
    t.integer "category_id"
    t.integer "user_id"
  end

  create_table "user_interests", :force => true do |t|
    t.integer "user_id"
    t.integer "interest_id"
  end

  create_table "user_skills", :force => true do |t|
    t.integer "user_id"
    t.integer "skill_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "tagline"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "image"
    t.integer  "reputation"
  end

end
