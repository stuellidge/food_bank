class CreateFoodDonations < ActiveRecord::Migration
  def change
    create_table :food_donations do |t|
      t.date :donated
      t.references :donor

      t.timestamps
    end
    add_index :food_donations, :donor_id
  end
end
