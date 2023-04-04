class CreateTransactionAnalysis < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_analyses do |t|
      t.references :user_transaction
      t.decimal :value
      t.boolean :same_ownership # mesma titularidade
      t.string :bank_code
      t.boolean :two_factor_authentication #2fa
      t.boolean :beneficiary_two_factor_authentication # benificiario 2fa
      t.decimal :amount_transacted_on_the_day # valor transacionado no dia
      t.integer :transactions_made_in_the_last_hour_for_this_beneficiary # transações feitas na última hora para esse benificiario
      t.boolean :fraud

      t.timestamps
    end
  end
end
