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

ActiveRecord::Schema.define(version: 20180313064447) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                null: false
    t.integer  "item_id",                null: false
    t.integer  "color_id",               null: false
    t.integer  "size_id",                null: false
    t.integer  "quantity",   default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["color_id"], name: "index_carts_on_color_id", using: :btree
    t.index ["item_id"], name: "index_carts_on_item_id", using: :btree
    t.index ["size_id"], name: "index_carts_on_size_id", using: :btree
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "colors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",    null: false
    t.integer  "color_id",   null: false
    t.integer  "size_id",    null: false
    t.integer  "stock",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_item_lists_on_color_id", using: :btree
    t.index ["item_id"], name: "index_item_lists_on_item_id", using: :btree
    t.index ["size_id"], name: "index_item_lists_on_size_id", using: :btree
  end

  create_table "item_sub_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",      null: false
    t.integer  "sub_image_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["item_id"], name: "index_item_sub_images_on_item_id", using: :btree
    t.index ["sub_image_id"], name: "index_item_sub_images_on_sub_image_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "price",                     null: false
    t.string   "name",                      null: false
    t.text     "description", limit: 65535, null: false
    t.integer  "shop_id",                   null: false
    t.integer  "brand_id",                  null: false
    t.string   "image_url",                 null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["shop_id"], name: "index_items_on_shop_id", using: :btree
  end

  create_table "ordered_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id",   null: false
    t.integer  "item_id",    null: false
    t.integer  "color_id",   null: false
    t.integer  "size_id",    null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_ordered_items_on_color_id", using: :btree
    t.index ["item_id"], name: "index_ordered_items_on_item_id", using: :btree
    t.index ["order_id"], name: "index_ordered_items_on_order_id", using: :btree
    t.index ["size_id"], name: "index_ordered_items_on_size_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.integer  "total_price", null: false
    t.integer  "status",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "method", null: false
    t.integer "fee",    null: false
  end

  create_table "shipments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "method", null: false
    t.integer "fee",    null: false
  end

  create_table "shipping_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status", null: false
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "color_id",   null: false
    t.string   "image_url",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_sub_images_on_color_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "postcode"
    t.string   "address_main"
    t.string   "address_sub"
    t.integer  "telephone_number"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "carts", "colors"
  add_foreign_key "carts", "items"
  add_foreign_key "carts", "sizes"
  add_foreign_key "carts", "users"
  add_foreign_key "item_lists", "colors"
  add_foreign_key "item_lists", "items"
  add_foreign_key "item_lists", "sizes"
  add_foreign_key "item_sub_images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "shops"
  add_foreign_key "ordered_items", "colors"
  add_foreign_key "ordered_items", "items"
  add_foreign_key "ordered_items", "orders"
  add_foreign_key "ordered_items", "sizes"
  add_foreign_key "orders", "users"
  add_foreign_key "sub_images", "colors"
end
