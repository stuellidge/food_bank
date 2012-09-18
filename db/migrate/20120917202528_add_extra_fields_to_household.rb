class AddExtraFieldsToHousehold < ActiveRecord::Migration
  def change
    add_column :households, :number_of_adults, :integer
    add_column :households, :number_of_oaps, :integer
    add_column :households, :number_of_babies, :integer
    add_column :households, :baby_nappy_sizes, :string
    add_column :households, :number_of_small_children, :integer
    add_column :households, :small_child_nappy_sizes, :string
    add_column :households, :number_of_children, :integer
    add_column :households, :dietary_requirements, :text
    add_column :households, :cooker, :boolean
    add_column :households, :microwave, :boolean
    add_column :households, :kettle, :boolean
    add_column :households, :no_facilities, :boolean
    add_column :households, :comments, :text
  end
end
