class Item < ActiveRecord::Base
  attr_accessible :available, :description, :available_dates, :lender_id, :price, :title
  serialize :available_dates, Array
  has_many :photos

  validates_presence_of :title

  belongs_to :lender, :class_name => 'User'
  
  has_many :borrowings
  has_many :borrowers, :through => :borrowings, :source => :user
  has_many :received_feedbacks, :through => :borrowings, :source => :feedback
end
