class CreateProductSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sizes do |t|
      t.string :size

      t.timestamps
    end
  end
end
