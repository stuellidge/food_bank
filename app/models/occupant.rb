class Occupant < ActiveRecord::Base
  
  SEX = ["male", "female"]
  
  def self.SEX 
    SEX
  end
  
  def to_s
    title + " " + forename[0] + " " + surname
  end
  
  belongs_to :contact_information, :dependent => :destroy
  attr_accessible :date_of_birth, :forename, :sex, :surname, :title, :contact_information_attributes  
  accepts_nested_attributes_for :contact_information, :allow_destroy => true
  
  validates :title, :presence => true
  validates :forename, :presence => true
  validates :surname, :presence => true
end
