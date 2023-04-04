class UserTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :bank_account
  has_one :transaction_analysis
  validates :beneficiary_account_id, presence: true
end
