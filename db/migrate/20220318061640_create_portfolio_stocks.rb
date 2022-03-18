class CreatePortfolioStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolio_stocks do |t|
      t.string :stock_symbol
      t.decimal :current_stock_valuation
      t.decimal :total_quantity
      t.decimal :total_value

      t.timestamps
    end
  end
end
