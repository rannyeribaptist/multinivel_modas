class CreateShoppingCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_cart_items do |t|
      t.belongs_to :shopping_cart, null: false, foreign_key: true
      t.references :product
      t.integer :quantity, default: 1
      t.string :size

      t.timestamps
    end
  end
end
