# frozen_string_literal: true

class RemoveRoleFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role, :integer
  end
end
