class CreateFoodDonationLines < ActiveRecord::Migration
  def change
    create_table :food_donation_lines do |t|
      t.references :food_donation
      t.references :product
      t.integer :quantity

      t.timestamps
    end
    add_index :food_donation_lines, :food_donation_id
    add_index :food_donation_lines, :product_id
  end
end
