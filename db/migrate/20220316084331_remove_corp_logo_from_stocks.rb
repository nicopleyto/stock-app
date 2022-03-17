class RemoveCorpLogoFromStocks < ActiveRecord::Migration[6.1]
  def change
    remove_column :stocks, :corp_logo, :string
  end
end
