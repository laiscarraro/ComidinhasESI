class Categories < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :products do |t|
      t.index :category_id
      t.index :product_id
    end
  end
end
