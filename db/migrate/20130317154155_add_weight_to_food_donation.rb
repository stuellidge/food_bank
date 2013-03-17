class AddWeightToFoodDonation < ActiveRecord::Migration
  def change
    add_column :food_donations, :weight, :decimal
  end
end
