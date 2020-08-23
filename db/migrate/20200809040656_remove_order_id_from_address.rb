class RemoveOrderIdFromAddress < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :order_id, :bigint
    remove_index :addresses, :name => "index_addresses_on_order_id"
  end
end
