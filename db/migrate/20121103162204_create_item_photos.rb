class CreateItemPhotos < ActiveRecord::Migration
  def change
    create_table :item_photos do |t|
      t.string :photo_file_name # Original filename
      t.string :photo_content_type # Mime type
      t.string :photo_file_size # File size in bytes
      t.timestamps
    end
  end
end
