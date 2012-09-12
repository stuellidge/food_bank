class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :town
      t.string :city
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end
end
