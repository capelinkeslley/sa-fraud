module Analysis
  class ProcessUserTransactionService
    def initialize(user_transaction)
      @user_transaction = user_transaction
    end

    def call
      @transaction_analysis = Analysis::CreateTransactionAnalysisService.new(user_transaction).call
      transaction_analysis.update(fraud: fraud?)
      Account::SetBalanceService.new(transaction_analysis).call unless transaction_analysis.fraud
    end

    private

    attr_accessor :user_transaction, :transaction_analysis

    def fraud?
      conn = Faraday.new(url: 'http://127.0.0.1:5000/fraud_detection') do |faraday|
        faraday.headers['Content-Type'] = 'application/json'
      end

      response = conn.post do |req|
        req.body = { data: data }.to_json
      end

      JSON.parse(response.body)['fraud_prediction']
    end

    def data
      [transaction_analysis.value.to_f, transaction_analysis.same_ownership, transaction_analysis.bank_code.to_i, transaction_analysis.two_factor_authentication, transaction_analysis.beneficiary_two_factor_authentication, transaction_analysis.amount_transacted_on_the_day.to_f,transaction_analysis.transactions_made_in_the_last_hour_for_this_beneficiary]
    end
  end
end
