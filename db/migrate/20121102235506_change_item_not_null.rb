class ChangeItemNotNull < ActiveRecord::Migration
  def up
  	change_column :items, :name, :string, :null => false
  	change_column :items, :price, :float, :null => false
  	change_column :items, :published, :boolean, :null => false, :default => false
  end

  def down
  end
end
