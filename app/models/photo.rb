class Photo < ActiveRecord::Base
  attr_accessible :file, :item_id
  belongs_to :item
  mount_uploader :file, Uploader
end