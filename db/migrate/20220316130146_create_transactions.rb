class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :stock_symbol
      t.boolean :transaction_type_buy?
      t.decimal :order_quantity
      t.decimal :price_during_transaction
      t.decimal :total_stock_amount

      t.timestamps
    end
  end
end
