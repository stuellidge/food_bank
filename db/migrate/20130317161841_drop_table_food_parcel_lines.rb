class DropTableFoodParcelLines < ActiveRecord::Migration
  def up
    drop_table :food_parcel_lines
  end

  def down
    create_table "food_parcel_lines", :force => true do |t|
      t.integer  "food_parcel_id"
      t.integer  "product_id"
      t.integer  "quantity"
      t.datetime "created_at",     :null => false
      t.datetime "updated_at",     :null => false
    end

    add_index "food_parcel_lines", ["food_parcel_id"], :name => "index_food_parcel_lines_on_food_parcel_id"
    add_index "food_parcel_lines", ["product_id"], :name => "index_food_parcel_lines_on_product_id"
  end
end
