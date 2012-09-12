class AddHouseholdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :household_id, :integer
  end
end
