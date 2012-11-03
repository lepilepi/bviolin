class Item < ActiveRecord::Base
  attr_accessible :long_desc, :name, :price, :published, :short_desc
  
  validates_presence_of :name
  validates_presence_of :price
end
