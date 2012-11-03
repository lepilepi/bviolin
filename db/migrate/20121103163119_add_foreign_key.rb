class AddForeignKey < ActiveRecord::Migration
  def change
  	add_column :item_photos, :item_id, :integer # Original filename
  end
end
