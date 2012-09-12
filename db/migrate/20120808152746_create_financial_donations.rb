class CreateFinancialDonations < ActiveRecord::Migration
  def change
    create_table :financial_donations do |t|
      t.date :donated
      t.references :donor
      t.decimal :amount
      t.boolean :gift_aid

      t.timestamps
    end
    add_index :financial_donations, :donor_id
  end
end
