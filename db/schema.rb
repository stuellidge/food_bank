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

ActiveRecord::Schema.define(:version => 20120912203231) do

  create_table "addresses", :force => true do |t|
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "town"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "household_id"
  end

  create_table "contact_informations", :force => true do |t|
    t.string   "email"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "facsimile"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "donors", :force => true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.integer  "contact_information_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "donors", ["address_id"], :name => "index_donors_on_address_id"
  add_index "donors", ["contact_information_id"], :name => "index_donors_on_contact_information_id"

  create_table "expenditures", :force => true do |t|
    t.date     "date"
    t.decimal  "amount"
    t.integer  "purpose"
    t.text     "reason"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "financial_donations", :force => true do |t|
    t.date     "donated"
    t.integer  "donor_id"
    t.decimal  "amount"
    t.boolean  "gift_aid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "financial_donations", ["donor_id"], :name => "index_financial_donations_on_donor_id"

  create_table "food_donation_lines", :force => true do |t|
    t.integer  "food_donation_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "food_donation_lines", ["food_donation_id"], :name => "index_food_donation_lines_on_food_donation_id"
  add_index "food_donation_lines", ["product_id"], :name => "index_food_donation_lines_on_product_id"

  create_table "food_donations", :force => true do |t|
    t.date     "donated"
    t.integer  "donor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "food_donations", ["donor_id"], :name => "index_food_donations_on_donor_id"

  create_table "food_parcel_lines", :force => true do |t|
    t.integer  "food_parcel_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "food_parcel_lines", ["food_parcel_id"], :name => "index_food_parcel_lines_on_food_parcel_id"
  add_index "food_parcel_lines", ["product_id"], :name => "index_food_parcel_lines_on_product_id"

  create_table "food_parcels", :force => true do |t|
    t.integer  "household_id"
    t.date     "date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "food_parcels", ["household_id"], :name => "index_food_parcels_on_household_id"

  create_table "households", :force => true do |t|
    t.integer  "address_id"
    t.boolean  "disability"
    t.text     "reason"
    t.date     "referral_date"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "primary_occupant_id"
  end

  add_index "households", ["address_id"], :name => "index_households_on_address_id"

  create_table "occupants", :force => true do |t|
    t.string   "title"
    t.string   "forename"
    t.string   "surname"
    t.string   "sex"
    t.date     "date_of_birth"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "type"
    t.integer  "household_id"
    t.integer  "relationship_to_primary"
    t.integer  "contact_information_id"
  end

  create_table "products", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "stock",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "referring_agencies", :force => true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.integer  "contact_information_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "referring_agencies", ["address_id"], :name => "index_referring_agencies_on_address_id"
  add_index "referring_agencies", ["contact_information_id"], :name => "index_referring_agencies_on_contact_information_id"

end
