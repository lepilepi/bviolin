class DefaultPhoto < ActiveRecord::Migration
  def change
	add_column :items, :item_photo_id, :integer
  end
end
