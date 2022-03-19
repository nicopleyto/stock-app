class RemoveCurrentStockValuationFromPortfolioStocks < ActiveRecord::Migration[6.1]
  def change
    remove_column :portfolio_stocks, :current_stock_valuation, :decimal
  end
end
