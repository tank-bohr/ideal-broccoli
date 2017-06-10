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

ActiveRecord::Schema.define(version: 20170610212453) do

  create_table "group_hosts", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "host_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "host_id"], name: "index_group_hosts_on_group_id_and_host_id", unique: true
    t.index ["group_id"], name: "index_group_hosts_on_group_id"
    t.index ["host_id"], name: "index_group_hosts_on_host_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "kind", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_groups_on_created_at"
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "hosts", force: :cascade do |t|
    t.string "fqdn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_hosts_on_created_at"
    t.index ["fqdn"], name: "index_hosts_on_fqdn", unique: true
  end

  create_table "restrictions", force: :cascade do |t|
    t.integer "group_id", null: false
    t.string "kind", null: false
    t.integer "dependent_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dependent_group_id"], name: "index_restrictions_on_dependent_group_id"
    t.index ["group_id"], name: "index_restrictions_on_group_id"
  end

end
