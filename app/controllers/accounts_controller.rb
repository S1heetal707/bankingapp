class AccountsController < ApplicationController

  before_action :set_account_params, only: :create
  before_action :set_account, only: %i[show edit update destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(set_account_params)

    if @account.save
      redirect_to accounts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @account.update(set_account_params)
      redirect_to accounts_path
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to root_path
  end

  private 
    def set_account_params
      params.require(:account).permit(:first_name, :last_name, :address, :gender, :open_date, :balance ,:user_id)
    end

    def current_date
      open_date = Time.current 
    end

    def set_account
      @account = Account.find(params[:id])
    end

end
