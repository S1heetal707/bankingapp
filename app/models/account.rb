class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions 
  after_initialize :init   

  validates :user, presence: true
  validates :balance , presence: true, numericality: true


 after_initialize :init

  def init
    self.balance  ||= 2000           #will set the default value only if it's nil
  end

end



