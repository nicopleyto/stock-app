class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :corp_name
      t.text :corp_description

      t.timestamps
    end
  end
end
