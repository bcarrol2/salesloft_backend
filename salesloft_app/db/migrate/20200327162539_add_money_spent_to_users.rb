class AddMoneySpentToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :money_spent, :integer
  end
end
