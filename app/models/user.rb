# frozen_string_literal: true

class User < ApplicationRecord
  require 'securerandom'

  has_secure_password

  before_create :set_default_status

  enum status: %i[admin customer]

  has_one :account, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true

  with_options if: :is_admin? do |admin|
    admin.validates :password, length: { minimum: 7 }
    admin.validates :email, presence: true
  end

  def is_admin?
    status == 1
  end

  def set_default_status
    self.status ||= :customer
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
end
