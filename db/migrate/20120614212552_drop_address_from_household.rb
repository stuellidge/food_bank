class DropAddressFromHousehold < ActiveRecord::Migration
  def change
    remove_column :households, :address_id
  end
end
