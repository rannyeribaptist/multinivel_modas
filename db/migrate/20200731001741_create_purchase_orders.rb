class CreatePurchaseOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_orders do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity
      t.string :status

      t.timestamps
    end
  end
end
