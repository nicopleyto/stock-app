class CurrentUserTransactionsController < ApplicationController
  before_action :approved_trader, only: [:index, :show]

  def index
    @transactions = current_user.transactions.order(id: "DESC")
  end

  def show
    @transaction = current_user.transactions.find(params[:id])
  end

  private

  def approved_trader
    if current_user.role == "trader" && current_user.state == "Approved"
      return
    else
      redirect_to root_path, notice: "Please wait until your application has been approved before doing this action."
    end
  end
end
