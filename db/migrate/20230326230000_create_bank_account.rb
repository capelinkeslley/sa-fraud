class CreateBankAccount < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.references :user
      t.references :bank
      t.decimal :balance, default: 20_000
      t.timestamps
    end
  end
end
