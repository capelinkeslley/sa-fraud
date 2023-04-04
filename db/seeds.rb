# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'User 1', two_factor_authentication: true)
User.create(name: 'User 2', two_factor_authentication: false)
User.create(name: 'User 3', two_factor_authentication: true)
User.create(name: 'User 4', two_factor_authentication: true)

Bank.create(name: 'Bank 1', code: '321')
Bank.create(name: 'Bank 2', code: '1')

BankAccount.create(user_id: 1, bank_id: 1)
BankAccount.create(user_id: 1, bank_id: 2)

BankAccount.create(user_id: 2, bank_id: 1)
BankAccount.create(user_id: 2, bank_id: 2)

BankAccount.create(user_id: 3, bank_id: 1)
BankAccount.create(user_id: 3, bank_id: 2)

BankAccount.create(user_id: 4, bank_id: 1)
BankAccount.create(user_id: 4, bank_id: 2)

# transações de mesma titularidade do user_id == 1
UserTransaction.create(user_id: 1, bank_account_id: 1, beneficiary_account_id: 2, value: 99)

UserTransaction.create(user_id: 1, bank_account_id: 2, beneficiary_account_id: 1, value: 200)

# transações de mesma titularidade do user_id == 2

UserTransaction.create(user_id: 2, bank_account_id: 6, beneficiary_account_id: 7, value: 200)

UserTransaction.create(user_id: 2, bank_account_id: 7, beneficiary_account_id: 6, value: 99)

# transações de mesma titularidade do user_id == 3
UserTransaction.create(user_id: 3, bank_account_id: 11, beneficiary_account_id: 12, value: 200)
UserTransaction.create(user_id: 3, bank_account_id: 12, beneficiary_account_id: 11, value: 99)

# transações de mesma titularidade do user_id == 4
UserTransaction.create(user_id: 4, bank_account_id: 13, beneficiary_account_id: 14, value: 99)
UserTransaction.create(user_id: 4, bank_account_id: 14, beneficiary_account_id: 13, value: 200)

# transações para outros clientes do user_id == 1
UserTransaction.create(user_id: 1, bank_account_id: 1, beneficiary_account_id: 3, value: 99)
UserTransaction.create(user_id: 1, bank_account_id: 1, beneficiary_account_id: 5, value: 200)
UserTransaction.create(user_id: 1, bank_account_id: 1, beneficiary_account_id: 7, value: 99)

# transações para outros clientes do user_id == 2
UserTransaction.create(user_id: 2, bank_account_id: 3, beneficiary_account_id: 1, value: 200)
UserTransaction.create(user_id: 2, bank_account_id: 3, beneficiary_account_id: 5, value: 99)
UserTransaction.create(user_id: 2, bank_account_id: 3, beneficiary_account_id: 7, value: 200)

# transações para outros clientes do user_id == 3
UserTransaction.create(user_id: 3, bank_account_id: 5, beneficiary_account_id: 1, value: 200)
UserTransaction.create(user_id: 3, bank_account_id: 5, beneficiary_account_id: 3, value: 99)
UserTransaction.create(user_id: 3, bank_account_id: 5, beneficiary_account_id: 7, value: 200)

# transações para outros clientes do user_id == 4
UserTransaction.create(user_id: 4, bank_account_id: 7, beneficiary_account_id: 1, value: 200)
UserTransaction.create(user_id: 4, bank_account_id: 7, beneficiary_account_id: 3, value: 99)
UserTransaction.create(user_id: 4, bank_account_id: 7, beneficiary_account_id: 5, value: 200)

TransactionAnalysis.create(
  user_transaction_id: 1,
  value: 99,
  same_ownership: true,
  bank_code: "1",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: false
) 

TransactionAnalysis.create(
  user_transaction_id: 2,
  value: 200,
  same_ownership: true,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: false
)
TransactionAnalysis.create(
  user_transaction_id: 4,
  value: 0.99e2,
  same_ownership: false,
  bank_code: "1",
  two_factor_authentication: false,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)

TransactionAnalysis.create(
  user_transaction_id: 3,
  value: 200,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: false,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)

TransactionAnalysis.create(
  user_transaction_id: 5,
  value: 99,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: false,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: false
)
  
TransactionAnalysis.create(
  user_transaction_id: 6,
  value: 200,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)

TransactionAnalysis.create(
  user_transaction_id: 7,
  value: 99,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: false
)
TransactionAnalysis.create(
  user_transaction_id: 8,
  value: 200,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: false,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)

TransactionAnalysis.create(
  user_transaction_id: 9,
  value: 99,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: false,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)

TransactionAnalysis.create(
  user_transaction_id: 10,
  value: 200,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: false,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)

TransactionAnalysis.create(
  user_transaction_id: 11,
  value: 200,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)

TransactionAnalysis.create(
  user_transaction_id: 12,
  value: 99,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: false,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: false
)

TransactionAnalysis.create(
  user_transaction_id: 13,
  value: 200,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)

TransactionAnalysis.create(
  user_transaction_id: 14,
  value: 200,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)

TransactionAnalysis.create(
  user_transaction_id: 15,
  value: 99,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: false,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: false
)

TransactionAnalysis.create(
  user_transaction_id: 16,
  value: 200,
  same_ownership: false,
  bank_code: "321",
  two_factor_authentication: true,
  beneficiary_two_factor_authentication: true,
  amount_transacted_on_the_day: nil,
  transactions_made_in_the_last_hour_for_this_beneficiary: 0,
  fraud: true
)