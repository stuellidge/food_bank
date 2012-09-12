class AddTypeToOccupant < ActiveRecord::Migration
  def self.up
    add_column :occupants, :type, :string
  end
  
  def self.down
    remove_column :occupants, :type
  end
end
