module Analysis
  class CreateTransactionAnalysisService
    def initialize(user_transaction)
      @user_transaction = user_transaction
    end

    def call
      create_transaction_analysis
    end

    private

    attr_accessor :user_transaction

    def user
      @user ||= user_transaction.user
    end

    def bank_account_beneficiary
      @bank_account_beneficiary ||= BankAccount.find_by(id: user_transaction.beneficiary_account_id)
    end

    def bank_beneficiary
      @bank_beneficiary ||= bank_account_beneficiary.bank
    end

    def beneficiary
      @beneficiary || bank_account_beneficiary.user
    end

    def same_ownership?
      user.eql?(beneficiary)
    end

    def amount_transacted_on_the_day
      UserTransaction.where(user_id: user.id, status: 'processed')
                     .where('created_at::date = current_date').sum(:value).to_f
    end

    def transactions_made_in_the_last_hour_for_this_beneficiary
      UserTransaction.where(user_id: user.id, beneficiary_account_id: bank_account_beneficiary.id, status: 'processed')
                     .where("created_at > '#{1.hour.ago}'").size
    end

    def create_transaction_analysis
      binding.pry
      TransactionAnalysis.create!(
        user_transaction_id: user_transaction.id,
        value: user_transaction.value,
        same_ownership: same_ownership?,
        bank_code: bank_beneficiary.code,
        two_factor_authentication: user.two_factor_authentication,
        beneficiary_two_factor_authentication: beneficiary.two_factor_authentication,
        amount_transacted_on_the_day: amount_transacted_on_the_day,
        transactions_made_in_the_last_hour_for_this_beneficiary: transactions_made_in_the_last_hour_for_this_beneficiary
      )
    end
  end
end

# TransactionAnalysis.create!(value: user_transaction.value,same_ownership: same_ownership?,bank_code: bank_beneficiary.code,two_factor_authentication: user.two_factor_authentication,beneficiary_two_factor_authentication: beneficiary.two_factor_authentication,amount_transacted_on_the_day: amount_transacted_on_the_day,transactions_made_in_the_last_hour_for_this_beneficiary: transactions_made_in_the_last_hour_for_this_beneficiary)