class TransactionsController < ApplicationController

  def index
  end

  def new
    @transaction = Transaction.new
  end

  def create
    # sender data updation current_balance = current_balance - params[amount]
    @account = current_user.account
    update_sender_data = @account.update(balance: @account.balance - params[:transaction][:amount].to_i)

     # receiver data updation current_balance = current_balance + params[amount]
     byebug
    @receiver_account = Transaction.current_user.receiver
    update_receiver_data = @receiver_account.update(balance:  @receiver_account.balance + params[:transaction][:amount].to_i)

    if update_sender_data.present?
      redirect_to transactions_path
    else
      render :new
      flash[:notice] = "Error, try again"
    end
  end

end
