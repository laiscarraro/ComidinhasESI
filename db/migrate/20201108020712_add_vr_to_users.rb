class AddVrToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :vr, :boolean, default:false
  end
end
