class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.date :date
      t.decimal :amount
      t.integer :purpose
      t.text :reason

      t.timestamps
    end
  end
end
