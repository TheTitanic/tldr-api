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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151120212537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["token"], name: "index_accounts_on_token", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "heading",    null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.text     "content",     null: false
    t.integer  "length",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profile_id"
  end

  add_index "documents", ["profile_id"], name: "index_documents_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "username",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "profiles", ["account_id"], name: "index_profiles_on_account_id", using: :btree
  add_index "profiles", ["username"], name: "index_profiles_on_username", unique: true, using: :btree

  create_table "snippets", force: :cascade do |t|
    t.text     "content",        null: false
    t.integer  "start_position", null: false
    t.integer  "end_position",   null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "document_id"
  end

  add_index "snippets", ["document_id"], name: "index_snippets_on_document_id", using: :btree

  create_table "translations", force: :cascade do |t|
    t.string   "heading",    null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "snippet_id"
  end

  add_index "translations", ["snippet_id"], name: "index_translations_on_snippet_id", using: :btree

  add_foreign_key "documents", "profiles"
  add_foreign_key "profiles", "accounts"
  add_foreign_key "snippets", "documents"
  add_foreign_key "translations", "snippets"
end
