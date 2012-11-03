class Item < ActiveRecord::Base
  attr_accessible :long_desc, :name, :price, :published, :short_desc, :photo

  has_attached_file :photo,
    :styles => {
      :thumb => "100x100",
      :small  => "150x150",
  	  :big => "300x300"}

  validates_presence_of :name
  validates_presence_of :price
end
