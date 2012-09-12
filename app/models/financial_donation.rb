class FinancialDonation < ActiveRecord::Base
  validates :amount, :presence => true, :numericality => { :greater_than => 0 }
  validates :donor, :presence => true
  belongs_to :donor
  attr_accessible :amount, :donated, :gift_aid, :donor_id
end
