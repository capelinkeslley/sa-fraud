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

ActiveRecord::Schema[7.0].define(version: 2023_03_26_234726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bank_id"
    t.decimal "balance", default: "20000.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_bank_accounts_on_bank_id"
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_analyses", force: :cascade do |t|
    t.bigint "user_transaction_id"
    t.decimal "value"
    t.boolean "same_ownership"
    t.string "bank_code"
    t.boolean "two_factor_authentication"
    t.boolean "beneficiary_two_factor_authentication"
    t.decimal "amount_transacted_on_the_day"
    t.integer "transactions_made_in_the_last_hour_for_this_beneficiary"
    t.boolean "fraud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_transaction_id"], name: "index_transaction_analyses_on_user_transaction_id"
  end

  create_table "user_transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bank_account_id"
    t.integer "beneficiary_account_id"
    t.string "status", default: "pending"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_account_id"], name: "index_user_transactions_on_bank_account_id"
    t.index ["user_id"], name: "index_user_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "two_factor_authentication", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
