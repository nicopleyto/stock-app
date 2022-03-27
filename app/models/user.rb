class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enum role: [:trader, :admin]
  validates :balance, numericality: {greater_than_or_equal_to: 0}
  validates :state, presence: true
  STATE = ["Pending", "Declined", "Approved"]

  has_many :transactions, dependent: :destroy
  has_many :portfolio_stocks, dependent: :destroy
end
