class AddDefaultToUserBalance < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :balance, :decimal, default: 0
  end
end
