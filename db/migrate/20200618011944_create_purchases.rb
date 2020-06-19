class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :payment_method
      t.string :value
      t.belongs_to :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
