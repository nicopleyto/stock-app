class CurrentUserTransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.order(id: "DESC")
  end

  def show
    @transaction = current_user.transactions.find(params[:id])
  end
end
