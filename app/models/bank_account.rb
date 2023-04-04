class BankAccount < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  has_many :user_transactions
end