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

ActiveRecord::Schema.define(:version => 20101107140542) do

  create_table "cart_items", :force => true do |t|
    t.integer  "item_id"
    t.integer  "cart_id"
    t.float    "price"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size_id"
    t.integer  "colour_id"
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 50, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colours", :force => true do |t|
    t.string   "name",                     :default => "", :null => false
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_eng",   :limit => 50
    t.string   "html_code",  :limit => 50
  end

  create_table "contacts", :force => true do |t|
    t.string   "email",      :limit => 50,  :default => "", :null => false
    t.string   "name",       :limit => 50
    t.string   "phone",      :limit => 50
    t.string   "address",    :limit => 100
    t.string   "photo",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icq",        :limit => 20
  end

  create_table "data_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_posts", :force => true do |t|
    t.string   "name",       :limit => 50, :default => "", :null => false
    t.string   "subject",                  :default => "", :null => false
    t.text     "body"
    t.integer  "root_id",                  :default => 0,  :null => false
    t.integer  "parent_id",                :default => 0,  :null => false
    t.integer  "lft",                      :default => 0,  :null => false
    t.integer  "rgt",                      :default => 0,  :null => false
    t.integer  "depth",                    :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "name",        :limit => 100, :default => "", :null => false
    t.text     "blurb"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "season_id"
    t.string   "type"
  end

  create_table "items_colours", :id => false, :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id",    :null => false
    t.integer  "colour_id",  :null => false
  end

  create_table "items_sizes", :id => false, :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id",    :null => false
    t.integer  "size_id",    :null => false
  end

  create_table "mugshots", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.float    "price"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size_id"
    t.integer  "colour_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "email"
    t.string   "phone_number"
    t.string   "ship_to_first_name"
    t.string   "ship_to_last_name"
    t.string   "ship_to_middle_name"
    t.string   "ship_to_address"
    t.string   "ship_to_city"
    t.string   "ship_to_postal_code"
    t.string   "ship_to_country"
    t.string   "customer_ip"
    t.string   "status"
    t.string   "error_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comments",            :limit => 500
  end

  create_table "photos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comment",      :limit => 50
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "item_id"
    t.string   "name"
  end

  create_table "seasons", :force => true do |t|
    t.string   "name",       :limit => 50, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon",       :limit => 50
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sizes", :force => true do |t|
    t.string   "name",       :limit => 30, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "first_name",                :limit => 80
    t.string   "last_name",                 :limit => 80
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "pw_reset_code",             :limit => 40
  end

end
