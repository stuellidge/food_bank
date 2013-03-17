class DropTableFoodDonationLines < ActiveRecord::Migration
  def up
    drop_table :food_donation_lines
  end

  def down
    create_table "food_donation_lines", :force => true do |t|
      t.integer  "food_donation_id"
      t.integer  "product_id"
      t.integer  "quantity"
      t.datetime "created_at",       :null => false
      t.datetime "updated_at",       :null => false
    end

    add_index "food_donation_lines", ["food_donation_id"], :name => "index_food_donation_lines_on_food_donation_id"
    add_index "food_donation_lines", ["product_id"], :name => "index_food_donation_lines_on_product_id"
  end
end
