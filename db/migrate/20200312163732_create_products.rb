class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :price
      t.boolean :hidden
      t.string :quantity

      t.timestamps
    end
  end
end
