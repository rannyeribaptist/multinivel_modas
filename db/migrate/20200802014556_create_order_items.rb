class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :item_name
      t.string :item_option
      t.belongs_to :order, null: false, foreign_key: true
      t.string :quantity

      t.timestamps
    end
  end
end
