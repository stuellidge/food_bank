module FoodDonationsHelper
  def product_codes
    Product.all(:order => :code).map { |p| p.code }.to_json
  end
  
  def product_names
    Product.all(:order => :name).map { |p| p.name }.to_json
  end
  
  def product_matrix
    product_matrix_array =  Product.all.map { |p| [p.code, {:id => p.id, :name => p.name}] }.flatten
    Hash[*product_matrix_array].to_json
  end
  
  def inverse_product_matrix
    product_matrix_array =  Product.all.map { |p| [p.name, {:id => p.id, :code => p.code}] }.flatten
    Hash[*product_matrix_array].to_json
  end
end
