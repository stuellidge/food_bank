class AddParcelCountToHouseholds < ActiveRecord::Migration
  def self.up
    add_column :households, :food_parcels_count, :integer, :null => false, :default => 0
    # reset cached counts for nominations with comments only

    Household.find_each do |household|
      Household.reset_counters(household.id, :food_parcels)
    end
  end
  
  def self.down
    remove_column :households, :food_parcels_count
  end
end
