class FoodParcel < ActiveRecord::Base
  after_update :update_weight
  after_create :create_weight
  after_destroy :delete_weight  
  
  belongs_to :household
  attr_accessible :date, :household_id, :weight
  
  validates :household, :presence => true
  validates_numericality_of :weight, :greater_than => 0
  
  private
    def update_weight
      if self.weight_changed?
        ApplicationData.update_weight(self.weight_was - self.weight)
      end      
    end
    
    def create_weight
      ApplicationData.update_weight(-self.weight)
    end
    
    def delete_weight
      ApplicationData.update_weight(self.weight)
    end
    
end
