class CreatePurchaseOrdersItems < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_orders_items do |t|
      t.integer :quantity
      t.string :size
      t.belongs_to :purchase_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
