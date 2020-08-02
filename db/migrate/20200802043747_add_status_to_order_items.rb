class AddStatusToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :status, :string
    add_column :order_items, :product_reference, :string
  end
end
