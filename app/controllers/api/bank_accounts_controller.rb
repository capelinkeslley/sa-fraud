module Api
  class BankAccountsController < ApplicationController
    def user_bank_accounts
      render json: BankAccount.where(user_id: user_id)
    end

    def beneficiary_accounts
      render json: BankAccount.where.not(id: bank_account_id)
    end

    private

    def user_id
      params.require(:user_id)
    end

    def bank_account_id
      params.require(:bank_account_id)
    end
  end
end