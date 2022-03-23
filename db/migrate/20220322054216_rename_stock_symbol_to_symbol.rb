class RenameStockSymbolToSymbol < ActiveRecord::Migration[6.1]
  def change
    rename_column :portfolio_stocks, :stock_symbol, :symbol
  end
end
