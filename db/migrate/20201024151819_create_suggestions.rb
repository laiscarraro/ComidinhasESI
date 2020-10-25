class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.string :name
      t.numeric :likes

      t.timestamps
    end
  end
end
