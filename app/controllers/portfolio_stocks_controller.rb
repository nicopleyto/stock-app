class PortfolioStocksController < ApplicationController
  def index
    @portfolio_stocks = current_user.portfolio_stocks
  end

  def show
    @portfolio_stock = current_user.portfolio_stocks.find(params[:id])
  end

  def edit #similar to edit action, set resource to be updated here (buy stock)
    stocksymbol = params[:stocksymbol]
    @portfolio_stock = current_user.portfolio_stocks.find_or_create_by(:symbol => stocksymbol)
  end

  def update #similar to update action, add incremented quantity here (confirm purchase)
    stocksymbol = params[:stocksymbol]
    @portfolio_stock = current_user.portfolio_stocks.find_or_create_by(:symbol => stocksymbol) #returns duplicate instance. must refactor

    if @portfolio_stock.update(portfolio_stock_params)
      redirect_to @portfolio_stock, notice: 'Stock was successfully bought.'
    else
      render :edit
    end

  end

  private

  def portfolio_stock_params
    params.require(:portfolio_stock).permit(:symbol, :total_quantity)
  end

end
