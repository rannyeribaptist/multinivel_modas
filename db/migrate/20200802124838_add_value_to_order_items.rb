class AddValueToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :value, :string
  end
end
