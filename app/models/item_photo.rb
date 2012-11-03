class ItemPhoto < ActiveRecord::Base
   belongs_to :item
   attr_accessible :photo

   has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150",
  	  :big => "300x300"}
end
