class AddSizeToPurchaseOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_orders, :size, :string
  end
end
