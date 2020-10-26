class DropSizesAndQuantityFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :quantity, :string
    remove_column :products, :sizes, :string
  end
end
