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

ActiveRecord::Schema.define(version: 20170503000459) do

  create_table "album_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description",   limit: 65535
    t.integer  "user_id"
    t.integer  "album_type_id"
    t.integer  "location_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "albums_photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "album_id"
    t.integer "photo_id"
    t.index ["album_id"], name: "index_albums_photos_on_album_id", using: :btree
    t.index ["photo_id"], name: "index_albums_photos_on_photo_id", using: :btree
  end

  create_table "experiences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.datetime "initial_date"
    t.datetime "final_date"
    t.text     "summary",      limit: 65535
    t.boolean  "is_current",                 default: false
    t.integer  "user_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "country"
    t.string   "state"
    t.string   "department"
    t.string   "city"
    t.integer  "latitude"
    t.integer  "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passwords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "active",            default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["persistence_token"], name: "index_passwords_on_persistence_token", unique: true, using: :btree
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phone_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "number"
    t.string   "ext"
    t.integer  "phone_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "photo_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.string   "title"
    t.text     "description",   limit: 65535
    t.integer  "location_id"
    t.boolean  "is_cover",                    default: false
    t.integer  "photo_type_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "roles_permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "role_id"
    t.integer "permission_id"
    t.index ["permission_id"], name: "index_roles_permissions_on_permission_id", using: :btree
    t.index ["role_id"], name: "index_roles_permissions_on_role_id", using: :btree
  end

  create_table "social_nets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.integer  "object_id"
    t.integer  "object_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "percent"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "name"
    t.string   "last_name"
    t.datetime "dob"
    t.text     "about_me",    limit: 65535
    t.string   "sex"
    t.integer  "photo_id"
    t.integer  "role_id"
    t.integer  "location_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users_phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "phone_id"
    t.index ["phone_id"], name: "index_users_phones_on_phone_id", using: :btree
    t.index ["user_id"], name: "index_users_phones_on_user_id", using: :btree
  end

  create_table "web_views", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "object_id"
    t.string   "object_type"
    t.integer  "views"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "web_visits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ip"
    t.datetime "date"
    t.string   "page"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end