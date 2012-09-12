class Address < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :city, :county, :postcode, :town
  
  def to_s
    str = address_line_1
    str << ", " << address_line_2 unless address_line_2.empty? 
    str << ", " << town unless town.empty? 
    str << ", " << city unless city.empty? 
    str << ", " << county unless county.empty? 
    str << ", " << postcode unless postcode.empty? 
    return str
  end
  
end
