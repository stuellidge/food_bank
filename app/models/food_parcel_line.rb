class FoodParcelLine < ActiveRecord::Base
  belongs_to :food_parcel
  belongs_to :product
  attr_accessible :quantity, :product_id
  
  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :product_id, :presence => true
end
