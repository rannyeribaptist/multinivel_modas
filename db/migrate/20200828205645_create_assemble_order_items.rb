class CreateAssembleOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :assemble_order_items do |t|
      t.belongs_to :purchase_item, null: false, foreign_key: true
      t.belongs_to :assemble_order, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
