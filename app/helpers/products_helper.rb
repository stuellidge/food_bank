module ProductsHelper
  def product_categories
    Product.where("category is not null").order(:category).uniq.pluck(:category).to_json
  end
end
