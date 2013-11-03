class User < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email, :image_url

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true

  has_many :lended_items, :class_name => 'Item', :foreign_key => :lender_id
  has_many :pending_requests, :through => :lended_items, :source => :borrowings, :conditions => {:borrowings => {:status => 'pending'}}

  has_many :borrowings
  has_many :borrowed_items, :through => :borrowings, :source => :item

  has_many :given_feedbacks, :class_name => 'Feedback', :foreign_key => :giver_id

  has_many :received_feedbacks, :through => :lended_items, :source => :received_feedbacks

  acts_as_messageable


  def self.from_facebook(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.extra.raw_info.first_name
      user.last_name = auth.extra.raw_info.last_name
      user.email = auth.extra.raw_info.email
      user.facebook_url = auth.extra.raw_info.link
      user.image_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

      user.save!
      return user
    end
  end

def display_name
  return self.first_name + " " + self.last_name
end

def notifications_email(object)
  return self.email
end

end
