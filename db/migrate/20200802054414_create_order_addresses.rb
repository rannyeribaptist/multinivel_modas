class CreateOrderAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_addresses do |t|
      t.string :street
      t.string :neighbohood
      t.string :city
      t.string :state
      t.string :number
      t.string :cep
      t.string :complement
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
