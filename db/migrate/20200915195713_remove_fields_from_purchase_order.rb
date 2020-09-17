class RemoveFieldsFromPurchaseOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchase_orders, :size, :string
    remove_column :purchase_orders, :quantity, :string
  end
end
