class User < ApplicationRecord
  has_many :bank_accounts
  has_many :user_transactions

  validates :name, presence: true
end