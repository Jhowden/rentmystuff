class Feedback < ActiveRecord::Base
  attr_accessible :comment, :thumbs_up

  validates :thumbs_up, :inclusion => {:in => [true,false]}
  validates_presence_of :comment

  has_many :borrowings
  has_many :items, :through => :borrowings
end
