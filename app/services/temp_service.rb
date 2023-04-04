class TempService
  def initialize(transaction_analysis)
    @transaction_analysis = transaction_analysis
  end

  def call
    return false if transaction_analysis.same_ownership
    return true unless transaction_analysis.two_factor_authentication

    return true if transaction_analysis.bank_code.eql?(1) && !transaction_analysis.benificiary_two_factor_authentication
    return true if transaction_analysis.value > 100
    return true if (transaction_analysis.amount_transacted_on_the_day.to_f + transaction_analysis.value) > 2000
    return true if transaction_analysis.transactions_made_in_the_last_hour_for_this_beneficiary > 5

    false
  end

  private

  attr_accessor :transaction_analysis
end