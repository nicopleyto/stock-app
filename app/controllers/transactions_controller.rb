class TransactionsController < ApplicationController
  before_action :verify_is_admin, only: [:index, :show]

  def index
    @all_transactions = Transaction.all.order(id: "DESC")
    @todays_transactions = Transaction.where(created_at: Date.current.all_day).order(id: "DESC")
    @yesterdays_transactions = Transaction.where(created_at: Date.current.prev_day.all_day).order(id: "DESC")
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  private

  def verify_is_admin
    if current_user.admin?
       return
    else
       redirect_to root_path, notice: "You must be an admin to perform this action."
    end
  end

end
