class AddPixToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pix, :boolean
  end
end
