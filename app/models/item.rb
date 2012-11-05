class Item < ActiveRecord::Base
  attr_accessible :long_desc, :name, :price, :published, :short_desc, :item_photo

  validates_presence_of :name
  validates_presence_of :price

  has_many :item_photos
  belongs_to :item_photo
end
