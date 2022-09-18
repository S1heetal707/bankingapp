# frozen_string_literal: true

class AccountsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_account_params, only: :create
  before_action :set_account, only: %i[show edit update destroy]
  protect_from_forgery except: [:create]

  def index
    @accounts = Account.all
    render json: @accounts
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(set_account_params)
    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @account, status: :ok
  end

  def edit; end

  def update
    if @account.update(set_account_params)
      render json: @account, status: :ok
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
  end

  private

  def set_account_params
    params.permit(:first_name, :last_name, :address, :gender, :open_date, :balance, :user_id)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end
