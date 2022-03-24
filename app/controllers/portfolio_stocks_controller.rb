class PortfolioStocksController < ApplicationController
  require "bigdecimal/util"

  def index
    @portfolio_stocks = current_user.portfolio_stocks
  end

  def show
    @portfolio_stock = current_user.portfolio_stocks.find(params[:id])
  end

  def buy #similar to edit action, set resource to be updated here (buy stock)
    stocksymbol = params[:stocksymbol]
    @portfolio_stock = current_user.portfolio_stocks.find_or_initialize_by(:symbol => stocksymbol) do |p|
      p.total_quantity = 0
    end
    
  end

  def update #similar to update action, add incremented quantity here (confirm purchase)
    stocksymbol = portfolio_stock_params[:symbol]
    @portfolio_stock = current_user.portfolio_stocks.find_by(:symbol => stocksymbol)

    @portfolio_stock.total_quantity += portfolio_stock_params[:total_quantity].to_d
    
    if @portfolio_stock.save
      redirect_to @portfolio_stock, notice: 'Stock was successfully bought.'
    else
      render :buy
    end

  end

  def create #similar to update action, add incremented quantity here (confirm purchase)
    @portfolio_stock = current_user.portfolio_stocks.build(portfolio_stock_params)

    if @portfolio_stock.save
      redirect_to @portfolio_stock, notice: 'Stock was successfully bought.'
    else
      render :buy
    end

  end

  def sell
    stocksymbol = params[:stocksymbol]
    @portfolio_stock = current_user.portfolio_stocks.find_by(:symbol => stocksymbol)
  end

  def confirm_sell
    stocksymbol = portfolio_stock_params[:symbol]
    @portfolio_stock = current_user.portfolio_stocks.find_by(:symbol => stocksymbol)

    @portfolio_stock.total_quantity -= portfolio_stock_params[:total_quantity].to_d

    if @portfolio_stock.save
      redirect_to portfolio_stocks_path, notice: 'Stock was successfully sold.'
      #create sell transaction
      @portfolio_stock.purge_zero_quantity_stock
    else
      render :sell
    end
  end

  private

  def portfolio_stock_params
    params.require(:portfolio_stock).permit(:symbol, :total_quantity)
  end
end
