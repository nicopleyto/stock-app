class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enum role: [:trader, :admin]

  validates :state, presence: true
  STATE = ["Pending", "Declined", "Approved"]

  has_many :transactions
end
