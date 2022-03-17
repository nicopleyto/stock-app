class AddCorpLogoToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :corp_logo, :string
  end
end
