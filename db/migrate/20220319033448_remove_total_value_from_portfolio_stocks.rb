class RemoveTotalValueFromPortfolioStocks < ActiveRecord::Migration[6.1]
  def change
    remove_column :portfolio_stocks, :total_value, :decimal
  end
end
