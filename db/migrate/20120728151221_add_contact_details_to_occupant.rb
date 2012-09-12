class AddContactDetailsToOccupant < ActiveRecord::Migration
  def change
    add_column :occupants, :contact_information_id, :integer
  end
end
