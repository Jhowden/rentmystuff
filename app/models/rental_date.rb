class RentalDate < ActiveRecord::Base
  attr_accessible :date
  belongs_to :dateable, :polymorphic => true
end
