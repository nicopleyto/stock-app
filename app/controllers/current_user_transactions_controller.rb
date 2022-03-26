class CurrentUserTransactionsController < ApplicationController
  before_action :approved_trader, only: [:index, :show]

  def index
    @transactions = current_user.transactions
  end

  def show
    @transaction = current_user.transactions.find(params[:id])
  end

  private

  def approved_trader
    if current_user.where(role: "trader", state: "Approved")
       return
    else
       redirect_to root_path, notice: "Please wait until your application has been approved before doing this action."
    end
  end
end
