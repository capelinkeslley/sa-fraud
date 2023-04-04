module Analysis
  class ProcessUserTransactionService
    def initialize(user_transaction)
      @user_transaction = user_transaction
    end

    def call
      @transaction_analysis = Analysis::CreateTransactionAnalysisService.new(user_transaction).call
      transaction_analysis.update(fraud: fraud?)
      Account::SetBalanceService.new(transaction_analysis).call if transaction_analysis.fraud
    end

    private

    attr_accessor :user_transaction, :transaction_analysis

    def fraud?
      FraudAnalyzer::SendService.new(transaction_analysis).call
    end
  end
end
