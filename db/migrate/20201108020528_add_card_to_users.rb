class AddCardToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :card, :boolean, default:false 
  end
end
