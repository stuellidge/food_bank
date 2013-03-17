class FoodDonation < ActiveRecord::Base
  belongs_to :donor
  attr_accessible :donated, :donor_id, :weight
  validates :donor, :presence => true
  validates_numericality_of :weight, :greater_than => 0
end
