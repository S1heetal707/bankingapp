class UsersController < ApplicationController

  before_action :set_user, only: %i[show edit]
  
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  private
  def set_user
    @user = current_user
  end
end
