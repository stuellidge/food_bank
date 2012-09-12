class DropAddressFromHousehold < ActiveRecord::Migration
  def change
    remove_column :households, :address
  end
end
