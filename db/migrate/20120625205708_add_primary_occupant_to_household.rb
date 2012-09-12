class AddPrimaryOccupantToHousehold < ActiveRecord::Migration
  def change
    add_column :households, :primary_occupant_id, :integer
  end
end
