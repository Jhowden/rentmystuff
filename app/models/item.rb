class Item < ActiveRecord::Base
  attr_accessible :available, :description, :end_time, :lender_id, :price, :start_time, :title

  validates_presence_of :title

  belongs_to :lender, :class_name => 'User'
  
  has_many :borrowings
  has_many :borrowers, :through => :borrowings, :source => :user
  has_many :received_feedback, :through => :borrowings, :source => :feedback
end
