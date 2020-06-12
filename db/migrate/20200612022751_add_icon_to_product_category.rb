class AddIconToProductCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :product_categories, :icon, :string
  end
end
