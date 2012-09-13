class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :title, :forename, :surname, :username, :email, :password, :password_confirmation

  validates :title, :presence => true
  validates :forename, :presence => true
  validates :surname, :presence => true
  validates :username, :presence => true
  validates :email, :presence => true
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
end
