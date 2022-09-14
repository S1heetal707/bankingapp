class RemoveAccountNumberFromAccounts < ActiveRecord::Migration[7.0]
  def change
    remove_column :accounts, :account_number, :string
  end
end
