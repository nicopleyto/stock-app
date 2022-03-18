class PortfolioStocksController < ApplicationController
  def index
    @portfolio_stocks = current_user.portfolio_stocks
  end
end
