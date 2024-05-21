# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_21_003758) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "cnpj"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_categories_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "ctps"
    t.float "salary_base"
    t.integer "hours"
    t.float "commission_percent"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "item_purchases", force: :cascade do |t|
    t.bigint "purchase_id", null: false
    t.bigint "product_id", null: false
    t.decimal "value"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_item_purchases_on_product_id"
    t.index ["purchase_id"], name: "index_item_purchases_on_purchase_id"
  end

  create_table "payrolls", force: :cascade do |t|
    t.date "date_of_payroll"
    t.float "commission"
    t.float "discount"
    t.float "salary"
    t.string "description"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_payrolls_on_employee_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "weight"
    t.float "width"
    t.float "length"
    t.float "valueSell"
    t.float "valueBuy"
    t.float "depth"
    t.integer "quantity"
    t.text "description"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "price"
    t.boolean "paid"
    t.float "packageSize"
    t.boolean "receive"
    t.boolean "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "kind"
    t.integer "theme"
    t.integer "payroll_day"
    t.bigint "administrator_id", null: false
    t.string "name"
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_stores_on_administrator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "cpf"
    t.integer "role"
    t.string "state"
    t.string "cep"
    t.string "street"
    t.integer "number"
    t.string "phone"
    t.boolean "kind"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "administrators", "users"
  add_foreign_key "categories", "departments"
  add_foreign_key "employees", "users"
  add_foreign_key "item_purchases", "products"
  add_foreign_key "item_purchases", "purchases"
  add_foreign_key "payrolls", "employees"
  add_foreign_key "products", "categories"
  add_foreign_key "purchases", "users"
  add_foreign_key "stores", "administrators"
end
