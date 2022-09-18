# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, only: %i[show edit]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def edit
    render json: @user
  end

  private

  def set_user
    @user = current_user
  end
end
