class AddOrderToAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :order, null: false, foreign_key: true
  end
end
