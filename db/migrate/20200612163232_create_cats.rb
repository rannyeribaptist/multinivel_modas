class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
