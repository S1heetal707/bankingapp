class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions 
  after_initialize :init 
  before_create :current_date  

  validates :user, presence: true
  validates :balance , presence: true, numericality: true
  validates :address, presence: true
  validates :gender, presence: true


  def current_date
    self.open_date = Time.now
  end

  def init
    self.balance ||= 2000           #will set the default value only if it's nil
  end

end



