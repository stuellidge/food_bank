class Address < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :city, :county, :postcode, :town
  
  def to_s
    str = address_line_1
    if !address_line_2.empty?
      str += ", " + address_line_2 
    end
    if !town.empty? 
      str += ", " + town 
    end
    if !city.empty? 
      str += ", " + city 
    end
    if !county.empty? 
      str += ", " + county 
    end
    if !postcode.empty? 
      str += ", " + postcode
    end
    return str
  end

end
