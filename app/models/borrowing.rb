class Borrowing < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :feedback

  serialize :dates, Array

  def pending?
    status =='pending'
  end
end
