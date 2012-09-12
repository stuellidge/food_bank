class AddRelationshipToOtherOccupant < ActiveRecord::Migration
  def change
    add_column :occupants, :relationship_to_primary, :integer
  end
end
