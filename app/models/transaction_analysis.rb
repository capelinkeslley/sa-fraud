class TransactionAnalysis < ApplicationRecord
  belongs_to :user_transaction

  validates :value, presence: true
end
