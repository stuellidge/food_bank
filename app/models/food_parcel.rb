class FoodParcel < ActiveRecord::Base
  belongs_to :household
  attr_accessible :date, :household_id
  
  validates :household, :presence => true
end
