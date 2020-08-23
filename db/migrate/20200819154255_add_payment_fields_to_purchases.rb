class AddPaymentFieldsToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :payment_id, :string
    add_column :purchases, :payment_method_reference_id, :string
    add_column :purchases, :external_resource_url, :text
  end
end
