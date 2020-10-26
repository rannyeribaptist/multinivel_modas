class AddFreeShippingToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :free_shipping, :boolean, default: false
  end
end
