class ApplicationData < ActiveRecord::Base
  attr_accessible :weight
  
  def self.update_weight(weight_increment)
    app_data = self.find(:first)
    if app_data == nil
      app_data = ApplicationData.new
    end
    
    app_data.weight += weight_increment
    app_data.save
  end
end
