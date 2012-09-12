class CreateContactDetails < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|
      t.string :email
      t.string :telephone
      t.string :mobile
      t.string :facsimile

      t.timestamps
    end
  end
end
