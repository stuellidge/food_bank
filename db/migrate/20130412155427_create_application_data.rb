class CreateApplicationData < ActiveRecord::Migration
  def change
    create_table :application_data do |t|
      t.decimal :weight, :default => 0, :null => false

      t.timestamps
    end
  end
end
