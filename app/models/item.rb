class Item < ActiveRecord::Base
  attr_accessible :available, :description, :end_time, :lender_id, :price, :start_time, :title

  validates_presence_of :title
end
