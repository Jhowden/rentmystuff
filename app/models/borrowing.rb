class Borrowing < ActiveRecord::Base
  attr_accessible :user_id, :item_id
  belongs_to :user
  belongs_to :item
  belongs_to :feedback

  serialize :dates, Array

  def pending?
    status =='pending'
  end
end
