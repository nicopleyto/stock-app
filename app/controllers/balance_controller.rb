class BalanceController < ApplicationController
  before_action :set_user, :approved_trader

  def show; end

  def topup; end

  def withdraw; end

  def confirm_topup
    @user.balance += balance_params[:balance].to_d

    if @user.save!
      redirect_to root_path, notice: 'Top-up successful.'
    else
      render :topup
    end
  end

  def confirm_withdraw
    @user.balance -= balance_params[:balance].to_d

    if @user.save!
      redirect_to root_path, notice: 'Withdrawal successful.'
    else
      render :withdraw
    end
  end

  private

  def balance_params
    params.require(:user).permit(:balance)
  end

  def set_user
    @user = current_user
  end

  def approved_trader
    if current_user.role == "trader" && current_user.state == "Approved"
       return
    else
       redirect_to root_path, notice: "Please wait until your application has been approved before doing this action."
    end
  end
end
