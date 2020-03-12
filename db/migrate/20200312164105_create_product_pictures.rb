class CreateProductPictures < ActiveRecord::Migration[6.0]
  def change
    create_table :product_pictures do |t|
      t.string :picture
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
