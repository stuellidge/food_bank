class FoodDonation < ActiveRecord::Base
  belongs_to :donor
  attr_accessible :donated, :donor_id  
  validates :donor, :presence => true
end
