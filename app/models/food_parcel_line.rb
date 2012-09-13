class FoodParcelLine < ActiveRecord::Base
  #around_update :update_stock
  
  belongs_to :food_parcel
  belongs_to :product
  attr_accessible :quantity, :product_id
  
  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :product_id, :presence => true
  
  private
    def update_stock
      logger.debug "Updating the fpl! #{self.quantity_changed?} #{self.product.id}"
      yield
      logger.debug "Updated the fpl! #{self.quantity_was} #{self.quantity}"
    end
end
