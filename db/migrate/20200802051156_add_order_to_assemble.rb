class AddOrderToAssemble < ActiveRecord::Migration[6.0]
  def change
    add_reference :assembles, :order, null: false, foreign_key: true
  end
end
