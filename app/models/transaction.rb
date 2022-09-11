class Transaction < ApplicationRecord
  belongs_to :account

  after_create :transfer 

  def transfer
    self.balance ||= -amount
  end
end
