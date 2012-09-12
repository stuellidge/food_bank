class CreateFoodParcels < ActiveRecord::Migration
  def change
    create_table :food_parcels do |t|
      t.references :household
      t.date :date

      t.timestamps
    end
    add_index :food_parcels, :household_id
  end
end
