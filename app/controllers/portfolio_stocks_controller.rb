class PortfolioStocksController < ApplicationController
  def index
    @portfolio_stocks = current_user.portfolio_stocks
  end

  def show
    @portfolio_stock = current_user.portfolio_stocks.find(params[:id])
  end
end
