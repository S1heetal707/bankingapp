# frozen_string_literal: true

class RemoveStatusFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :status, :integer
  end
end
