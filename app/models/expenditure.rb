class Expenditure < ActiveRecord::Base
  
  PURPOSES = { food_purchase: 0, sundry_expense: 1, other: 2 }
  
  def self.PURPOSES 
    PURPOSES
  end
  
  attr_accessible :amount, :date, :purpose, :reason
  
  validates :date, :presence => true  
  validates :reason, :presence => true  
  validates :amount, :numericality => true
end
