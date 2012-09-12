class ContactInformation < ActiveRecord::Base
  attr_accessible :email, :telephone, :mobile, :facsimile
end
