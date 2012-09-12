class CreateReferringAgencies < ActiveRecord::Migration
  def change
    create_table :referring_agencies do |t|
      t.string :name
      t.references :address
      t.references :contact_information

      t.timestamps
    end
    add_index :referring_agencies, :address_id
    add_index :referring_agencies, :contact_information_id
  end
end
