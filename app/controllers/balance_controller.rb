class BalanceController < ApplicationController
  def show
    @balance = current_user.balance
  end

  def topup
  end

  def withdraw
  end

  def update
  end
end
