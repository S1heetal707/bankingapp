# frozen_string_literal: true

class Transaction < ApplicationRecord
  # before_create :current_balance
  # this is to change the association name
  belongs_to :receiver, class_name: 'Account', foreign_key: :receiver_id
  after_destroy :destroy_action
  # after_save :create_transaction

  def destroy_action
    puts 'Transactions destroyed'
  end

  # def current_balance
  #   # current_user.account.balance return unless self.balance <= 100
  #   balance = current_user.account.balance
  #   if self.balance <= 100
  #     render :new
  #     flash[:notice] = 'You does not have enough amount for the transaction'
  #   end
  # end
end
