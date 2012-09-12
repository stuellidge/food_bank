class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.references :address
      t.boolean :disability
      t.text :reason
      t.date :referral_date

      t.timestamps
    end
    add_index :households, :address_id
  end
end
