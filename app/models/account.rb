# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  after_create :set_balance
  after_destroy :destroy_user

  validates :user, presence: true
  validates :balance, presence: true, numericality: true
  validates :address, presence: true
  validates :gender, presence: true

  def destroy_user
    puts 'User destroyed'
  end

  def set_balance
    self.balance ||= 2000
  end
end

# class FebonacciSeries
#   i = 0, a = 0 , b = 1, c = 0

#   if i <= 5
#     c = a+b
#     a = b
#     b = c
#     i += 1
#   end
#   puts c

# end
