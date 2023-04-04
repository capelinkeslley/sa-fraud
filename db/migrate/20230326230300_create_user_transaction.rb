class CreateUserTransaction < ActiveRecord::Migration[7.0]
  def change
    create_table :user_transactions do |t|
      t.references :user
      t.references :bank_account
      t.integer :beneficiary_account_id
      t.string :status, default: 'pending'
      t.decimal :value

      t.timestamps
    end
  end
end
