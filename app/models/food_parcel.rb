class FoodParcel < ActiveRecord::Base
  belongs_to :household
  has_many :food_parcel_lines, :dependent => :destroy
  attr_accessible :date, :household_id, :food_parcel_lines_attributes
  accepts_nested_attributes_for :food_parcel_lines, :allow_destroy => true
  
  validates :household, :presence => true
  validates_associated :food_parcel_lines
end
