class CreatePurchaseItems < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_items do |t|
      t.belongs_to :purchase, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.string :size
      t.integer :quantity

      t.timestamps
    end
  end
end
