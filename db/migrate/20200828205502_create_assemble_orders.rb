class CreateAssembleOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :assemble_orders do |t|
      t.belongs_to :purchase, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
