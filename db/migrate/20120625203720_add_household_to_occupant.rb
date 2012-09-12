class AddHouseholdToOccupant < ActiveRecord::Migration
  def change
    add_column :occupants, :household_id, :integer
  end
end
