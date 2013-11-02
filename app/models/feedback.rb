class Feedback < ActiveRecord::Base
  attr_accessible :comment, :thumbs_up, :giver_id

  validates :thumbs_up, :inclusion => {:in => [true,false]}
  validates_presence_of :comment

  has_one :borrowing
  has_one :item, :through => :borrowings

  belongs_to :giver, :class_name => 'User'
end
