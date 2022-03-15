class AddPendingStateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :state, :string, null: false, default: 'Pending'
  end
end
