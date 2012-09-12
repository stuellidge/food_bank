class Household < ActiveRecord::Base
  
  def to_s
    primary_occupant.to_s + ", " + address.to_s
  end
  
  has_one :address, :dependent => :destroy
  has_one :primary_occupant, :dependent => :destroy
  has_many :other_occupants, :dependent => :destroy
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :primary_occupant, :allow_destroy => true
  attr_accessible :disability, :reason, :referral_date, :address_attributes, :primary_occupant_attributes
end
