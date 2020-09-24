class Categories < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :users do |t|
      t.index :category_id
      t.index :user_id
    end
  end
end
