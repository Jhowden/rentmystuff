class Borrowing < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :feedback

  has_many :dates, :as => :dateable, :class_name => 'RentalDate'


  def pending?
    status =='pending'
  end
end
