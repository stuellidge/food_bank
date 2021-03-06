class Donor < ActiveRecord::Base
  acts_as_reportable
  
  has_many :food_donations, :dependent => :destroy
  has_many :financial_donations, :dependent => :destroy

  belongs_to :address, :dependent => :destroy
  belongs_to :contact_information, :dependent => :destroy
  
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :contact_information, :allow_destroy => true
  
  attr_accessible :name, :address_attributes, :contact_information_attributes
  
  validates :name, :presence => true
  
  def to_s
    self.name
  end
  
end
