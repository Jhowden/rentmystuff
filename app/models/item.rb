class Item < ActiveRecord::Base
  attr_accessible :available, :description, :available_dates, :lender_id, :price, :title
  serialize :available_dates, Array
  has_many :photos

  validates_presence_of :title

  belongs_to :lender, :class_name => 'User'
  
  has_many :borrowings
  has_many :borrowers, :through => :borrowings, :source => :user
  has_many :received_feedbacks, :through => :borrowings, :source => :feedback

  def inavailable_dates
    availabilities = available_dates
    inavailable_dates = (availabilities[0]..availabilities[-1]).to_a - availabilities

    inavailable_dates.map{|date| date.strftime('%Y-%m-%d')}
  end
end
