class Product < ActiveRecord::Base
  attr_accessible :code, :name, :stock, :category
  
  validates :name, :presence => true
  validates :code, :uniqueness => true
  validates :name, :uniqueness => true
  
  def init
    self.stock ||= 0
  end
end
