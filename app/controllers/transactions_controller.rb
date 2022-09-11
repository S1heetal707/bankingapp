class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new 
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      @transaction.account.balance + amount
      flash[:success] = "Transaction successfull"
    else
      redirect_to :new
      flash[:notice] = "Error, try again"
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :account_id)
  end

end
