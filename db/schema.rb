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

ActiveRecord::Schema.define(:version => 20130226131015) do

  create_table "business_profile_types", :force => true do |t|
    t.integer  "business_profile_id"
    t.integer  "profile_type_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "business_profile_types", ["business_profile_id"], :name => "index_business_profile_types_on_business_profile_id"
  add_index "business_profile_types", ["profile_type_id"], :name => "index_business_profile_types_on_profile_type_id"

  create_table "business_profiles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "google"
    t.string   "employees"
    t.string   "slug"
    t.string   "address"
    t.boolean  "hiring"
    t.string   "image"
    t.string   "email"
    t.string   "phone"
    t.string   "linkedin"
    t.string   "github"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.integer  "owner"
    t.boolean  "responsible", :default => true
  end

  create_table "contact_forms", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.string   "phone"
    t.string   "subject",    :null => false
    t.text     "content",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news_items", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "url"
    t.text     "content"
    t.integer  "votes"
    t.boolean  "flagged"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news_items", ["user_id"], :name => "index_news_items_on_user_id"

  create_table "profile_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_business_profiles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "business_profile_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "is_owner"
    t.string   "position"
  end

  add_index "user_business_profiles", ["business_profile_id"], :name => "index_user_business_profiles_on_business_profile_id"
  add_index "user_business_profiles", ["user_id"], :name => "index_user_business_profiles_on_user_id"

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.text     "about"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "google"
    t.string   "slug"
    t.boolean  "mentor"
    t.string   "image"
    t.string   "name"
    t.string   "tagline"
    t.string   "linkedin"
    t.string   "github"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "slug"
    t.boolean  "opt_in"
    t.boolean  "accept_terms"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
