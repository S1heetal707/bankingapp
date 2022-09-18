# frozen_string_literal: true

class TransactionsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def index; end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      @account = current_user.account
      update_sender_data = @account.update(balance: @account.balance - amount)

      @receiver_account = Transaction.last.receiver
      update_receiver_data = @receiver_account.update(balance: @receiver_account.balance + amount)

      if update_sender_data.present?
        redirect_to transactions_path
      else
        render :new
        flash[:notice] = 'Error, try again'
      end
    end
  end

  private

  def transaction_params
    params.permit(:amount, :sender_id, :receiver_id, :account_id)
  end
end

# @account = current_user.account
# update_sender_data = @account.update(balance: @account.balance - params[:transaction][:amount].to_i)

# #receiver data updation current_balance = current_balance + params[amount]
# @receiver_account = Transaction.last.receiver
# update_receiver_data = @receiver_account.update(balance: @receiver_account.balance + params[:transaction][:amount].to_i)

# if update_sender_data.present?
#   redirect_to transactions_path
# else
#   render :new
#   flash[:notice] = 'Error, try again'
# end
# end
