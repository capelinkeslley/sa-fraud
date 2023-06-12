module Account
  class SetBalanceService
    def initialize(transaction_analysis)
      @transaction_analysis = transaction_analysis
    end

    def call
      bank_account.update(balance: balance - transaction_analysis.value)

      beneficiary_account.update(balance: beneficiary_account.balance + transaction_analysis.value)
      transaction_analysis.user_transaction.update(status: 'processed')
    end

    private

    attr_accessor :transaction_analysis

    def bank_account
      @bank_account ||= transaction_analysis.user_transaction.bank_account
    end

    def balance
      bank_account.balance
    end

    def beneficiary_account
      @beneficiary_account ||= BankAccount.find_by(id: beneficiary_id)
    end

    def beneficiary_id
      @beneficiary_id ||= transaction_analysis.user_transaction.beneficiary_account_id
    end
  end
end