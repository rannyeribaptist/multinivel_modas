class AddFieldsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_identification, :string
    add_column :orders, :client_name, :string
    add_column :orders, :client_email, :string
    add_column :orders, :client_id, :string
    add_column :orders, :client_phone, :string
    add_column :orders, :date, :string
  end
end
