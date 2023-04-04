module Api
  class UserTransactionsController < ApplicationController
    def create
      user_transaction = UserTransaction.new(attributes)

      if user_transaction.save!
        render json: user_transaction

        Analysis::ProcessUserTransactionService.new(user_transaction).call
      else
        render json: { error: 'Erro ao fazer transação' }
      end
    end

    private

    def attributes
      params.permit(:beneficiary_account_id, :value, :user_id, :bank_account_id)
    end
  end
end