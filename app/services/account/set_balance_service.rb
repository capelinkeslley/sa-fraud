module Account
  class SetBalanceService
    def initialize(transaction_analysis)
      @transaction_analysis = transaction_analysis
    end

    def call
      bank_account.update(balance: balance - transaction_analysis.value)
    end

    private

    attr_accessor :transaction_analysis

    def bank_account
      @bank_account ||= transaction_analysis.user_transaction.bank_account
    end

    def balance
      bank_account.balance
    end
  end
end