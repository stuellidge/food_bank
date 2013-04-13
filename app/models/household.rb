class Household < ActiveRecord::Base
  
  def to_s
    self.primary_occupant.to_s + ", " + self.address.to_s
  end
  
  has_one :address, :dependent => :destroy
  has_one :primary_occupant, :dependent => :destroy
  has_many :other_occupants, :dependent => :destroy
  has_many :food_parcels
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :primary_occupant, :allow_destroy => true
  attr_accessible :disability, :reason, :referral_date, :address_attributes, :primary_occupant_attributes, :number_of_adults, :number_of_oaps, :number_of_babies, :baby_nappy_sizes, :number_of_small_children, :small_child_nappy_sizes, :number_of_children, :cooker, :microwave, :kettle, :no_facilities, :dietary_requirements, :comments, :food_parcels
  
  validates_associated :address
  validates_associated :primary_occupant
end
