class AddWeightToFoodParcels < ActiveRecord::Migration
  def change
    add_column :food_parcels, :weight, :decimal, :null => false, :default => 0
  end
end
