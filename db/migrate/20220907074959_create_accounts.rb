# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :account_number
      t.string :address
      t.string :gender
      t.date :open_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
