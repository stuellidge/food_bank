class CreateOccupants < ActiveRecord::Migration
  def change
    create_table :occupants do |t|
      t.string :title
      t.string :forename
      t.string :surname
      t.string :sex
      t.date :date_of_birth

      t.timestamps
    end
  end
end
