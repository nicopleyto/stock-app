class PortfolioStocksController < ApplicationController
  require "bigdecimal/util"

  def index
    @portfolio_stocks = current_user.portfolio_stocks
  end

  def show
    @portfolio_stock = current_user.portfolio_stocks.find(params[:id])
  end

  def buy
    stocksymbol = params[:stocksymbol]
    @portfolio_stock = current_user.portfolio_stocks.find_or_initialize_by(:symbol => stocksymbol) do |p|
      p.total_quantity = 0
    end
    
  end

  def update
    stocksymbol = portfolio_stock_params[:symbol]
    @portfolio_stock = current_user.portfolio_stocks.find_by(:symbol => stocksymbol)

    @portfolio_stock.total_quantity += portfolio_stock_params[:total_quantity].to_d
    
    if @portfolio_stock.save
      redirect_to @portfolio_stock, notice: 'Stock was successfully bought.'
      create_transaction_record(true)
    else
      render :buy
    end

  end

  def create
    @portfolio_stock = current_user.portfolio_stocks.build(portfolio_stock_params)

    if @portfolio_stock.save
      redirect_to @portfolio_stock, notice: 'Stock was successfully bought.'
      create_transaction_record(true)
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
      create_transaction_record(false)
      @portfolio_stock.purge_zero_quantity_stock
    else
      render :sell
    end
  end

  private

  def portfolio_stock_params
    params.require(:portfolio_stock).permit(:symbol, :total_quantity)
  end

  def create_transaction_record(transaction_type)
    current_user.transactions.create(
      :stock_symbol => @portfolio_stock.symbol,
      :transaction_type_buy? => transaction_type,
      :order_quantity => portfolio_stock_params[:total_quantity].to_d,
      :price_during_transaction => @portfolio_stock.access_quote.latest_price,
      :total_stock_amount => portfolio_stock_params[:total_quantity].to_d * @portfolio_stock.access_quote.latest_price
    )
  end

end
