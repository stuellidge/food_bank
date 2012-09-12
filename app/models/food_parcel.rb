class FoodParcel < ActiveRecord::Base
  belongs_to :household
  has_many :food_parcel_lines
  attr_accessible :date, :household_id
  
  validates :household, :presence => true
  validates_associated :food_parcel_lines
end
