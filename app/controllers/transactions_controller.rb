class TransactionsController < ApplicationController

#add before_action :authenticate_admin
  def index
    @all_transactions = Transaction.all.order(id: "DESC")
    @todays_transactions = Transaction.where(created_at: Date.current.all_day).order(id: "DESC")
    @yesterdays_transactions = Transaction.where(created_at: Date.current.prev_day.all_day).order(id: "DESC")
  end

  def show
    @transaction = Transaction.find(params[:id])
  end
end
