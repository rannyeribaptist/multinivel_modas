class AddOriginalPriceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :original_price, :string
  end
end
