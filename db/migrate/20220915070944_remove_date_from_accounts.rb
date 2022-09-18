# frozen_string_literal: true

class RemoveDateFromAccounts < ActiveRecord::Migration[7.0]
  def change
    remove_column :accounts, :open_date, :date
  end
end
