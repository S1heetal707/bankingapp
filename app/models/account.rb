class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  before_save :account_balance    

  validates :user, presence: true
  # validates :account_number, presence: true, uniqueness: true
  # validates :balance , presence: true, numericality: true

  # before_validation :load_defaults

  def account_balance
    
  end

  # def load_defaults
  #   if self.new_record?
  #     self.balance = 0.0
  #   end
  # end

end
