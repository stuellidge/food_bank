class CreateFoodParcelLines < ActiveRecord::Migration
  def change
    create_table :food_parcel_lines do |t|
      t.references :food_parcel
      t.references :product
      t.integer :quantity

      t.timestamps
    end
    add_index :food_parcel_lines, :food_parcel_id
    add_index :food_parcel_lines, :product_id
  end
end
