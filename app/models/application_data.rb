class ApplicationData < ActiveRecord::Base
  validates :weight, :presence => true, :numericality => { :greater_than => 0 }  
  attr_accessible :weight
  
  def self.weight?
    app_data = self.find(:first)
    weight = 0
    if !app_data.nil?
      weight = app_data.weight
    end
    weight
  end
  
  def self.weight=(weight)
    app_data = self.find(:first)
    if app_data == nil
      app_data = ApplicationData.new
    end
    
    app_data.weight = weight
    app_data.save!
  end  
  
  def self.update_weight(weight_increment)
    app_data = self.find(:first)
    if app_data == nil
      app_data = ApplicationData.new
    end
    
    app_data.weight += weight_increment
    app_data.save!
  end
end
