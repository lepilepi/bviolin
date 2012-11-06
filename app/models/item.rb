class Item < ActiveRecord::Base
  attr_accessible :long_desc, :name, :price, :published, :short_desc, :item_photo

  validates_presence_of :name
  validates_presence_of :price

  has_many :item_photos
  belongs_to :item_photo

  def self.search(search, ordering_id)
  	  if ordering_id
  	  	order = ['name', 'price', 'created_at'][Integer(ordering_id)]
  	  else
  	  	order = 'name'
  	  end
	  if search
		find(:all, :conditions => ['name LIKE ?', "%#{search}%"], :order => order)
	  else
	    find(:all, :order => order)
	  end
   end

end
