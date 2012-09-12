class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :name
      t.references :address
      t.references :contact_information

      t.timestamps
    end
    add_index :donors, :address_id
    add_index :donors, :contact_information_id
  end
end
