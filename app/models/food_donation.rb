class FoodDonation < ActiveRecord::Base
  belongs_to :donor
  has_many :food_donation_lines
  attr_accessible :donated, :donor_id, :food_donation_lines_attributes
  accepts_nested_attributes_for :food_donation_lines, :allow_destroy => true
  
  validates :donor, :presence => true
end
