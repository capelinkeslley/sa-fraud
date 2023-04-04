module FraudAnalyzer
  class SendService
    def initialize(transaction_analysis)
      @transaction_analysis = transaction_analysis
    end

    def call
      TempService.new(transaction_analysis).call
    end

    private

    attr_accessor :transaction_analysis
  end
end