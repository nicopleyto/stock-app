class TransactionsController < ApplicationController

#add before_action :authenticate_admin
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end
end
