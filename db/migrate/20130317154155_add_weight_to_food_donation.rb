class AddWeightToFoodDonation < ActiveRecord::Migration
  def change
    add_column :food_donations, :weight, :decimal, :null => false, :default => 0
  end
end
