class CreateProductSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sizes do |t|
      t.string :size
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
