class Bank < ApplicationRecord
  has_many :bank_accounts

  validates :name, :code, presence: true
  validates :name, uniqueness: true
end