class ReferringAgency < ActiveRecord::Base
  
  belongs_to :address, :dependent => :destroy
  belongs_to :contact_information, :dependent => :destroy
  
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :contact_information, :allow_destroy => true
  
  attr_accessible :name, :address_attributes, :contact_information_attributes
end
