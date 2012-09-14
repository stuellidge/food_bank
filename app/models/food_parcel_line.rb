class FoodParcelLine < ActiveRecord::Base
  after_update :update_stock
  after_create :create_stock
  after_destroy :delete_stock
  
  belongs_to :food_parcel
  belongs_to :product
  attr_accessible :quantity, :product_id
  
  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :product_id, :presence => true
  
  private
    def update_stock
      if self.quantity_changed?
        stock_adjustment = self.quantity_was - self.quantity
        self.product.stock += stock_adjustment
        self.product.save
      end      
    end
    
    def create_stock
      self.product.stock -= self.quantity
      self.product.save
    end
    
    def delete_stock
      self.product.stock += self.quantity
      self.product.save
    end        
end