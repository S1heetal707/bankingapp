class Transaction < ApplicationRecord
  # before_create :current_balance
  # this is to change the association name
  belongs_to :receiver, class_name: "Account", :foreign_key => :receiver_id

  # def current_balance
  #   balance = current_user.account.balance
  #   if self.balance <= 100
  #     render :new
  #     flash[:notice] = "Error, try again"
  #   end
  # end
end

