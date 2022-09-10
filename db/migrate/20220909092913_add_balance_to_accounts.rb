class AddBalanceToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :balance, :integer
  end
end
