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

ActiveRecord::Schema.define(:version => 20121212192246) do

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "prename"
    t.string   "address"
    t.string   "account_number"
    t.string   "bank_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "contracts", :force => true do |t|
    t.integer  "number"
    t.integer  "contact_id"
    t.date     "start"
    t.integer  "duration_month"
    t.integer  "duration_years"
    t.float    "interest_rate"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "comment"
    t.string   "category"
  end

  add_index "contracts", ["contact_id"], :name => "index_contracts_on_contact_id"

end