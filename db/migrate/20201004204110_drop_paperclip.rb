class DropPaperclip < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :photo_file_name
    remove_column :products,	:photo_content_type
    remove_column :products,	:photo_file_size
    remove_column :products, :photo_updated_at
  end
end
