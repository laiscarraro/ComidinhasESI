class RemoveMoneyFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :money, :boolean
    remove_column :users, :default, :false
  end
end
