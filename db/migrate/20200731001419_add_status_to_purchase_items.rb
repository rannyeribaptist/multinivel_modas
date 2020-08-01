class AddStatusToPurchaseItems < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_items, :status, :string
  end
end
