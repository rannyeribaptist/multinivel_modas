class AddValueToPurchaseOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_orders, :value, :float
  end
end
