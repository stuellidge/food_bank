class AddStockDefaultToProduct < ActiveRecord::Migration
  def up
    change_column(:products, :stock, :integer, :default => 0)
  end
  
  def down
    change_column(:products, :stock, :integer)
  end
end
