class BalanceController < ApplicationController
  def topup
    @balance = current_user.balance
  end

  def withdraw
    @balance = current_user.balance
  end

  def confirm_topup
    @balance += balance_params[:balance].to_d

    if @balance.save
      redirect_to root_path, notice: 'Top-up successful.'
    else
      render :topup
    end
  end

  def confirm_withdraw
    @balance -= balance_params[:balance].to_d

    if @balance.save
      redirect_to root_path, notice: 'Withdrawal successful.'
    else
      render :withdraw
    end
  end

  private

  def balance_params
    params.require(:user).permit(:balance)
  end
end
