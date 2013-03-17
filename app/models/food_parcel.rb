class FoodParcel < ActiveRecord::Base
  belongs_to :household
  attr_accessible :date, :household_id, :weight
  
  validates :household, :presence => true
  validates_numericality_of :weight, :greater_than => 0
end
