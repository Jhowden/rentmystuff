class Item < ActiveRecord::Base
  attr_accessible :available, :description, :available_dates, :lender_id, :price, :title
  has_many :dates, :as => :dateable, :class_name => 'RentalDate'
  has_many :photos

  validates_presence_of :title

  belongs_to :lender, :class_name => 'User'
  
  has_many :borrowings
  has_many :borrowers, :through => :borrowings, :source => :user
  has_many :received_feedbacks, :through => :borrowings, :source => :feedback

  

  def self.search(q)
    desc = "%#{q[:description_cont]}%"
    daterange = q[:dates]
    self.where("items.description LIKE ? ", desc ).joins(:dates).where("rental_dates.date" => daterange).uniq.limit(20)
  end

  def inavailable_dates
    availabilities = available_dates
    inavailable_dates = (availabilities[0]...availabilities[-1]).to_a - availabilities

    inavailable_dates.map{|date| date.strftime('%Y-%m-%d')}
  end

  def max_date
    (available_dates.last - Date.today).to_i
  end

  def create_dates(ary)
    ary.each do |date|
      dates << RentalDate.create(:date => date)
    end
  end

  private

  def available_dates
    dates.map(&:date)
  end
end
