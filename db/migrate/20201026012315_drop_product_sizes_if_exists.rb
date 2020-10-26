class DropProductSizesIfExists < ActiveRecord::Migration[6.0]
  def change
    drop_table :product_sizes, if_exists: true
  end
end
