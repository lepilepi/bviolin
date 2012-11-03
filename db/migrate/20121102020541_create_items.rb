class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :short_desc, :default => ''
      t.string :long_desc, :default => ''
      t.float :price
      t.boolean :published, :default => false

      t.timestamps
    end
  end
end
