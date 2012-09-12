class FoodDonationLine < ActiveRecord::Base
  belongs_to :food_donation
  belongs_to :product
  accepts_nested_attributes_for :product, :allow_destroy => false  
  attr_accessible :quantity, :product_attributes
  
  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }
end
