class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :two_factor_authentication, default: false
      t.timestamps
    end
  end
end
