class AddUserRefToPortfolioStocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :portfolio_stocks, :user, null: false, foreign_key: true
  end
end
